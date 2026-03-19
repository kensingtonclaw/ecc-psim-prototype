# Everbridge Control Center — PSIM Prototype

Interactive HTML prototype for a 4-screen PSIM (Physical Security Information Management) operator workstation, designed for a hospital security operations center.

## Overview

This prototype visualises the UI layout for an Everbridge Control Center deployment across 4 docked operator screens, based on 247 use cases from the ESSR operational requirements register. It integrates 10 subsystems: Inner Range (Access Control), Milestone (VMS), Irisity (VCA), Ascom (Mobile Duress), Jacques (Intercom), Petronics (Fire), Trane (FMS), Axon (BWC), AiRISTA (RTLS), and SPOK (Messaging).

## Screens

### Screen 1 — Situational Awareness & Communications
Interactive floor plan maps with device overlays, Jacques intercom management panel with softphone controls, Trane FMS dashboard, and quick launch buttons for critical areas (Helipad, ED, Lockdown).

### Screen 2 — Alarm & Incident Management
Persistent split-pane: top half shows the alarm monitoring grid (Critical + Low Priority) at all times. Bottom half provides tabbed access to incident creation, incident detail with linked camera feeds (2x3 grid), alarm history, and alarm correlation.

### Screen 3 — Video Surveillance & Analytics
Live camera view with configurable tile grid, recorded playback with timeline scrubber, Irisity VCA analytics with appearance search, ANPR vehicle management, Axon BWC assignment and playback, and video wall controls.

### Screen 4 — Administration & Configuration
System health dashboard for all subsystems, Inner Range access control management (cardholder search, lockdown groups, door schedules), report builder with 13 report types, SOP document library, user/role configuration, and real-time Inner Range event monitor.

## Technical Notes

- **Single HTML file** — no external dependencies, no build step
- **CSS-only navigation** — all tab/screen switching uses hidden radio buttons and `:checked` selectors; works in restrictive corporate browser environments (Edge with JS blocked)
- **Dark theme** — designed for security operations center ambient lighting
- **Mock data throughout** — realistic alarm entries, camera feeds, device statuses

## Opening the Prototype

Open `output/ECC_PSIM_Prototype.html` in any browser. No server required.

## Input Files

- `input/Prompt.docx` — Original design brief specifying the 4-screen layout requirements
- `input/ESSR - Operational Use Case Definitions - PSIM V5.1.xlsx` — Complete use case register (247 use cases across 14 subsystem sheets)

## Use Case to Screen Allocation

The prototype includes a built-in Screen Allocation Matrix (click the "Info" button in the header) that traces every use case to its assigned screen and tab.
