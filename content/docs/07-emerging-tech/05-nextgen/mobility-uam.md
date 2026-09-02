---
title: UAM Urban Air Mobility and LEO Satellite Communication
description: UAM (Urban Air Mobility) control and communication systems, UTM (drone traffic management), global expansion of low-earth-orbit (LEO) satellite communication
type: docs
weight: 2
---

## 1. Overview of UAM and LEO Satellite Communication, Opening Urban Airways and Connecting the Globe via Orbital Satellites

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    A["Ground traffic saturation<br/>Limits of communication dead zones"] --"Low-altitude aviation autonomy,<br/>orbital satellite constellations"--> B["UAM urban air operations<br/>LEO satellite constellation communication"] --"Hyperconnected mobility,<br/>global coverage"--> C["Urban mobility innovation<br/>Realizing a digitally inclusive society"]
    style A fill:#FFEBEE,stroke:#D32F2F,color:#000
    style B fill:#E3F2FD,stroke:#1976D2,color:#000
    style C fill:#E8F5E9,stroke:#388E3C,color:#000
```

**Definition**: A next-generation transportation and communication technology system that combines electric vertical takeoff and landing (eVTOL)-based urban air mobility (UAM) with low-earth-orbit small satellite constellations (LEO constellations) to realize hyperconnected mobility infrastructure spanning the ground, air, and space.
- UAM manages safe low-altitude flight paths through UTM (drone traffic management systems) and 5G C2 links
- LEO satellites deliver low-latency, high-speed broadband worldwide from an altitude dramatically lower than GEO
- Creates diverse value by relieving urban congestion, closing communication dead zones in remote and maritime areas, and backing up disaster-response communication

**Characteristics**:
- **Autonomous flight control**: UTM-FIMS integration manages thousands of drones and eVTOLs simultaneously without collisions
- **Ultra-low-latency satellites**: LEO's 550 km orbit cuts latency to about 1/40 of GEO
- **Dual connectivity**: A Non-Terrestrial Network (NTN) combining terrestrial 5G and LEO satellites secures uninterrupted coverage

---

## 2. Core Structure of UAM and LEO Satellite Communication

### A. UAM Ecosystem and UTM System Structure

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    FIMS["FIMS<br/>Flight information management system"] --"Flight plan,<br/>approval, collision warning"--> UTM["UTM<br/>Drone traffic management"]
    UTM --"Real-time control,<br/>command delivery"--> UAM["eVTOL aircraft<br/>Autonomous flight control"]
    UAM --"Position, status,<br/>remote ID transmission"--> UTM
    UAM --"Passenger boarding,<br/>takeoff and landing"--> VPORT["Vertiport<br/>Urban takeoff/landing hub"]
    VPORT --"Charging, maintenance<br/>status"--> UTM
    style FIMS fill:#1E3A5F,stroke:#1E3A5F,color:#fff
    style UTM fill:#E3F2FD,stroke:#1976D2,color:#000
    style UAM fill:#F3E5F5,stroke:#7B1FA2,color:#000
    style VPORT fill:#E0F2F1,stroke:#00796B,color:#000
```

| Core UAM component | Role | Key technology |
|---|---|---|
| **eVTOL aircraft** | Electric vertical takeoff/landing autonomous or piloted aircraft | Distributed electric propulsion, autonomous flight software, redundant control |
| **UTM system** | Separates low-altitude flight paths, prevents collisions, monitors traffic | U-Space, FAA UTM, remote ID (RID) |
| **FIMS** | Hub for information sharing across UTMs and airspace approval | REST API, real-time flight-plan coordination |
| **C2 link** | Command and control communication between ground control and aircraft | 5G NR, LDACS, satellite backup link |
| **Vertiport** | Urban hub for takeoff/landing, charging, and maintenance | Automated charging pads, passenger check-in system |

---

### B. Low-Earth-Orbit (LEO) Satellite Communication Principles and Orbit Comparison

```mermaid
%%{init: { 'theme': 'base', 'themeVariables': { 'edgeLabelBackground': '#fff' }}}%%
flowchart LR
    GEO["GEO satellite<br/>36,000 km geostationary orbit<br/>High latency, wide-area coverage"] --"Lower orbit,<br/>shorter latency"--> MEO["MEO satellite<br/>2,000-20,000 km<br/>GPS/navigation only"]
    MEO --"Ultra-low orbit,<br/>constellation"--> LEO["LEO constellation satellites<br/>550-1,200 km<br/>Ultra-low latency, high-speed broadband"]
    LEO --"Ground station<br/>connection"--> GS["Gateway,<br/>ground station<br/>Integration with internet backbone"]
    style GEO fill:#FFEBEE,stroke:#D32F2F,color:#000
    style MEO fill:#FFF3E0,stroke:#F57C00,color:#000
    style LEO fill:#E3F2FD,stroke:#1976D2,color:#000
    style GS fill:#E8F5E9,stroke:#388E3C,color:#000
```

| Category | GEO | MEO | LEO |
|---|---|---|---|
| **Altitude** | About 36,000 km | 2,000-20,000 km | 340-1,200 km |
| **Communication latency** | About 600 ms round trip | About 100-200 ms | 20-40 ms (Starlink baseline) |
| **Coverage** | 3 satellites cover the globe | Global navigation service | Requires a constellation (hundreds to thousands) |
| **Main services** | Broadcasting, weather, VSAT | GPS, Galileo, O3b | Starlink, OneWeb, KT SAT |
| **Launch cost** | Hundreds of millions of dollars each | Mid-range | Low-cost mass launch via Falcon 9, New Shepard |
| **Domestic trends** | Koreasat 7 (Mugunghwa) | GNSS reception infrastructure | Hanwha Systems and KT expanding LEO investment |

---

## 3. Expected Benefits and Practical Applications of Adopting UAM and LEO Satellite Communication

| Category | Key benefits | Practical applications |
|---|---|---|
| **Urban mobility** | Urban air routes can cut ground travel time by over 70% | Select vertiport sites in the greater Seoul area, build an integrated UTM-traffic-control system, run eVTOL pilot routes |
| **Closing the connectivity gap** | LEO satellites deliver broadband to islands, mountains, and maritime dead zones | Apply the NTN-based standard for direct satellite connection of non-satellite 5G devices (3GPP Release 17 NTN) |
| **Disaster response** | LEO satellites and UAM relay mobile communication if ground base stations are destroyed | Operate UAM logistics and relief drones in disasters, build a satellite emergency-broadband pop-up service system |
| **Aviation safety** | FIMS-UTM automation supports the goal of zero collisions in low-altitude airspace | Mandate remote ID, adopt the UTM-ATM integration standard (U-space) early, apply cybersecurity encryption to C2 links |
