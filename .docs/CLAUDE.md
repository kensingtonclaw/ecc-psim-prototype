# ECC PSIM Prototype Project

## What This Is

A fully interactive HTML prototype of an **Everbridge Control Center (ECC) PSIM** multi-screen operator workstation for a hospital security operations center (QCH — Queensland Children's Hospital precinct).

## Project Structure

```
ecc-psim-prototype/
  input/
    Prompt.docx                           # Design brief / AI prompt specifying UI requirements
    ESSR - Operational Use Case Definitions - PSIM V5.1.xlsx  # 247 use cases across 14 sheets
  output/
    ECC_PSIM_Prototype.html               # The complete prototype (single file, ~2700 lines)
    Open_PSIM_Prototype.bat               # Windows launcher (PowerShell local server fallback)
```

## How It Was Built

1. Parsed the `.docx` prompt (Python zipfile + XML extraction — it's a binary Office format)
2. Parsed the `.xlsx` use case register (openpyxl) — 247 use cases across sheets: Everbridge, Milestone, Irisity, Inner Range, Jacques, Ascom, AiRISTA, Petronics, Trane, OTIS, Schindler, Thyssenkrupp, SPOK
3. Grouped use cases by source system, operator role, and functional affinity
4. Assigned each group to one of 4 operator screens based on workflow sequence
5. Built the HTML prototype with all mock data derived from the use cases

## Key Design Decisions

### CSS-Only Navigation (No JavaScript Required)
The prototype uses **hidden radio buttons + CSS `:checked` sibling selectors** for all tab/screen switching. This was necessary because the target deployment PCs run Microsoft Edge with strict security policies that block inline JavaScript on local `file://` pages. The only JS is a non-essential live clock.

Pattern used:
```html
<input type="radio" name="screen" id="screen-1" checked hidden>
...
<label for="screen-1" class="screen-tab">S1: Situational</label>
```
```css
#screen-1:checked ~ .main-content > #s1-panel { display: flex; }
```

### 4-Screen Layout

| Screen | Purpose | Primary Role | Key Subsystems |
|--------|---------|-------------|----------------|
| S1: Situational | Maps, intercom, facility monitoring | Operator | Jacques, Trane, All |
| S2: Alarms | Persistent alarm grid + incident management | Operator | All (alarm aggregation) |
| S3: Video | Live/recorded video, VCA, BWC, ANPR | Operator | Milestone, Irisity, Axon |
| S4: Admin | Dashboards, access control, reports, config | Administrator, Tech | Inner Range, Everbridge, All |

### Screen 2 Mandatory Constraint
The alarm monitoring grid on Screen 2 is **always visible** (top split-pane). Incident creation/detail tabs appear in the bottom pane without obscuring the alarm list. This was a non-negotiable requirement from the prompt.

## Integrated Subsystems

| Subsystem | Vendor | Use Case Count |
|-----------|--------|---------------|
| Access Control (EACS) | Inner Range Integriti | ~35 UC in Everbridge sheet + 35 in dedicated sheet |
| Video Management (VMS) | Milestone XProtect | ~30 UC |
| Video Analytics (VCA) | Irisity IRIS+ | ~12 UC |
| Mobile Duress (MDAS) | Ascom DURAsuite | ~22 UC |
| Intercom (ICS) | Jacques Intercom | ~20 UC |
| Fire Alarm (FAS) | Petronics | ~10 UC |
| Facility Management (FMS) | Trane | ~8 UC |
| Body Worn Camera (BWC) | Axon Evidence.com | ~14 UC |
| RTLS | AiRISTA | 6 UC |
| PSIM Platform | Everbridge Control Center | Core platform UC |

## How to View the Prototype

- **macOS/Linux**: Open `output/ECC_PSIM_Prototype.html` in any browser
- **Windows (Edge)**: Open directly — CSS-only navigation works without JS
- **Windows (fallback)**: Run `output/Open_PSIM_Prototype.bat` to serve via local PowerShell HTTP server

## Modifying the Prototype

The HTML file is self-contained with embedded CSS and no external dependencies. Key sections:
- Lines 1-970: `<style>` block (all CSS including CSS-only tab mechanics)
- Lines 970-2540: HTML content (4 screens, overlays, status bar)
- Lines 2540-end: Minimal `<script>` (clock only)

To add a new tab to a screen:
1. Add a new `<input type="radio">` at the top of `<body>` in the correct name group
2. Add a `<label for="...">` in the sub-tabs bar
3. Add the content `<div>` with matching ID
4. Add CSS rules for `:checked ~ ... { display: block; }`
