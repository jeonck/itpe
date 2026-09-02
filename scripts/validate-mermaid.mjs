// validate-mermaid.mjs — parse every ```mermaid block in the repo with the real Mermaid parser.
//
//   node scripts/validate-mermaid.mjs [root]      (default root: repo root)
//
// Structural diffing (scripts/verify.sh) proves the translation kept the diagram skeleton.
// This proves the skeleton is still valid Mermaid. 405 blocks; one broken block is a visible
// hole on the rendered page.
//
// Requires: playwright + mermaid installed under ../mmdcheck (see README "Local checks").

import { readFileSync, readdirSync, statSync } from 'node:fs';
import { join, resolve, relative } from 'node:path';
import { pathToFileURL } from 'node:url';

const ROOT = resolve(process.argv[2] ?? new URL('..', import.meta.url).pathname);
const DEPS = resolve(process.env.MMDCHECK_DIR ?? resolve(ROOT, '../mmdcheck'), 'node_modules');
const MERMAID = join(DEPS, 'mermaid/dist/mermaid.min.js');
const _pw = await import(pathToFileURL(join(DEPS, 'playwright/index.js')).href);
const chromium = (_pw.default ?? _pw).chromium;

function walk(dir, out = []) {
  for (const name of readdirSync(dir)) {
    if (name === 'node_modules' || name === '.git' || name === 'themes' || name === 'public') continue;
    const p = join(dir, name);
    const st = statSync(p);
    if (st.isDirectory()) walk(p, out);
    else if (name.endsWith('.md')) out.push(p);
  }
  return out;
}

function extractBlocks(file) {
  const lines = readFileSync(file, 'utf8').split('\n');
  const blocks = [];
  let cur = null;
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    if (cur === null && /^\s*```mermaid\s*$/.test(line)) { cur = { start: i + 1, lines: [] }; continue; }
    if (cur !== null) {
      if (/^\s*```\s*$/.test(line)) { blocks.push({ ...cur, text: cur.lines.join('\n') }); cur = null; }
      else cur.lines.push(line);
    }
  }
  if (cur !== null) blocks.push({ ...cur, text: cur.lines.join('\n'), unterminated: true });
  return blocks;
}

const files = walk(ROOT);
const jobs = [];
for (const f of files) {
  for (const b of extractBlocks(f)) {
    const file = relative(ROOT, f);
    const idx = jobs.filter(j => j.file === file).length + 1;   // 1-based block ordinal
    jobs.push({ file, idx, line: b.start, text: b.text, unterminated: !!b.unterminated });
  }
}

console.log(`mermaid blocks found: ${jobs.length} across ${new Set(jobs.map(j => j.file)).size} files`);

const launchOpts = { args: ['--no-sandbox', '--disable-dev-shm-usage'] };
if (process.env.CHROMIUM_PATH) launchOpts.executablePath = process.env.CHROMIUM_PATH;
const browser = await chromium.launch(launchOpts);
const page = await browser.newPage();
await page.setContent('<!doctype html><html><body></body></html>');
await page.addScriptTag({ path: MERMAID });
await page.evaluate(() => window.mermaid.initialize({ startOnLoad: false, securityLevel: 'loose' }));

const failures = [];
for (const j of jobs) {
  if (j.unterminated) { failures.push({ ...j, error: 'unterminated ```mermaid fence' }); continue; }
  const res = await page.evaluate(async (src) => {
    try { await window.mermaid.parse(src); return { ok: true }; }
    catch (e) { return { ok: false, error: String(e && e.message ? e.message : e).split('\n').slice(0, 3).join(' | ') }; }
  }, j.text);
  if (!res.ok) failures.push({ ...j, error: res.error });
}

await browser.close();

// Subtract blocks that already fail in the Korean source (scripts/mermaid-baseline.txt).
const baselinePath = join(ROOT, 'scripts/mermaid-baseline.txt');
let baseline = new Set();
try {
  baseline = new Set(readFileSync(baselinePath, 'utf8').split('\n')
    .map(l => l.trim()).filter(l => l && !l.startsWith('#')));
} catch { /* no baseline file: report everything */ }

const known = failures.filter(f => baseline.has(`${f.file}#${f.idx}`));
const failures_ = failures.filter(f => !baseline.has(`${f.file}#${f.idx}`));
if (known.length) console.log(`known-bad (present in the Korean source too): ${known.length}`);
failures.length = 0; failures.push(...failures_);

if (failures.length === 0) {
  console.log(`\nAll ${jobs.length} mermaid blocks parse cleanly.`);
  process.exit(0);
}

console.log(`\n${failures.length} block(s) failed to parse:\n`);
const byFile = new Map();
for (const f of failures) {
  if (!byFile.has(f.file)) byFile.set(f.file, []);
  byFile.get(f.file).push(f);
}
for (const [file, fs_] of byFile) {
  console.log(`  ${file}`);
  for (const f of fs_) console.log(`    block #${f.idx} (line ${f.line}): ${f.error}`);
}
console.log('\nfailing files:');
for (const file of byFile.keys()) console.log(file);
process.exit(1);
