# Space Station 14 Forks Guide

A comprehensive reference document detailing all known Space Station 14 forks, their relationships, and their characteristics. This serves as a master guide for consolidating features from multiple implementations.

**Last Updated**: January 14, 2026  
**Purpose**: Personal/For Fun - Consolidating every fork's unique features

---

## Repository Hierarchy

```c#
WizDen (space-wizards/space-station-14) [UPSTREAM]
├─ Starlight (ss14Starlight/space-station-14)
│  └─ Far Horizons (Far-Horizons-SS14/Far-Horizons-SS14)
│
├─ Nyanotrasen (Nyanotrasen/Nyanotrasen)
│  ├─ Delta-V (DeltaV-Station/Delta-v)
│  ├─ Parkstation (Simple-Station/Parkstation)
│  └─ Einstein Engines (Simple-Station/Einstein-Engines)
│     └─ Hullrot (Sector-Crescent/Hullrot)
│
├─ Frontier (new-frontiers-14/frontier-station-14)
│  └─ Monolith (Monolith-Station/Monolith)
│
├─ Crystal Edge (crystallpunk-14/crystall-edge)
│
├─ Impstation (impstation/imp-station-14)
│
├─ Goob-Station (Goob-Station/Goob-Station)
│  └─ Goob-Station Piras314 (Piras314/Goob-Station)
│
├─ Nuclear-14 (Vault-Overseers/nuclear-14)
│
├─ White Dream (WWhiteDreamProject/wwdpublic)
│
├─ Cosmatic Drift (cosmatic-drift-14/cosmatic-drift)
│
├─ HardLight (HardLightSector/HardLight)
│
├─ Emberfall (emberfall-14/emberfall)
│
├─ Moff Station (moff-station/moff-station-14)
│
├─ Space Syndicate (space-syndicate/space-station-14)
│
├─ Deep Station 14 (SS14-Classic/deep-station-14)
│
├─ Harmony Station (ss14-harmony/ss14-harmony)
│
├─ RMC-14 (RMC-14/RMC-14)
│
├─ Sunrise Station (space-sunrise/sunrise-station)
│
├─ Lust Station (space-sunrise/lust-station)
│
├─ Fire Station (space-sunrise/fire-station)
│
├─ Polonium Station (polonium14/polonium-station)
│
└─ Trieste Port (Pixeltheaertist/Trieste-Port-14)
```

---

## Fork Descriptions

### Tier 1: Major Forks (Direct from WizDen)

#### **WizDen** (space-wizards/space-station-14)
**Remote Name**: `upstream`  
**GitHub**: https://github.com/space-wizards/space-station-14

**How it Plays**:  
Baseline SS14 round-based station gameplay.

**Niche / Theme**:  
Canonical "intended" SS14 experience.

**What Makes It Different**:  
Everything else diverges from this. Cleanest ECS usage, strict code standards.

---

#### **Starlight** (ss14Starlight/space-station-14)
**Remote Name**: `starlight`  
**GitHub**: https://github.com/ss14Starlight/space-station-14

**How it Plays**:  
More serious, slower-paced station rounds.

**Niche / Theme**:  
Medium Roleplay (MRP).

**What Makes It Different**:  
Balance and rules tuned around player behavior, not chaos. Less gimmicks. This fork serves as the parent to Far Horizons.

---

#### **Nyanotrasen** (Nyanotrasen/Nyanotrasen)
**Remote Name**: `nyanotrasen`  
**GitHub**: https://github.com/Nyanotrasen/Nyanotrasen

**How it Plays**:  
Station gameplay with heavier systems and altered science.

**Niche / Theme**:  
"Reinvent SS13 mechanics in SS14."

**What Makes It Different**:  
Epistemics, deeper mechanics, less arcade-y than WizDen. One of the most prolific and well-established forks in the SS14 ecosystem, serving as the parent fork for three major branches (Delta-V, Parkstation, and Einstein Engines), indicating significant feature development.

**Child Forks**: Delta-V, Parkstation, Einstein Engines

---

#### **Frontier / New Frontiers** (new-frontiers-14/frontier-station-14)
**Remote Name**: `frontier`  
**GitHub**: https://github.com/new-frontiers-14/frontier-station-14

**How it Plays**:  
Persistent sandbox, ships instead of stations.

**Niche / Theme**:  
Open-world SS14.

**What Makes It Different**:  
Breaks the round-based station formula entirely.

**Child Forks**: Monolith

---

#### **Crystal Edge** (crystallpunk-14/crystall-edge)
**Remote Name**: `crystal-edge`  
**GitHub**: https://github.com/crystallpunk-14/crystall-edge

*Note: Detailed description pending. See related forks for similar themed mechanics.*

---

#### **Impstation** (impstation/imp-station-14)
**Remote Name**: `impstation`  
**GitHub**: https://github.com/impstation/imp-station-14

**How it Plays**:  
Content-rich, eclectic, unpredictable.

**Niche / Theme**:  
"Everything and the kitchen sink."

**What Makes It Different**:  
Explicitly merges ideas from many forks into one codebase.

---

#### **Goob-Station** (Goob-Station/Goob-Station)
**Remote Name**: `goob-station`  
**GitHub**: https://github.com/Goob-Station/Goob-Station

**How it Plays**:  
Lighter, sillier station rounds.

**Niche / Theme**:  
Fun-first SS14.

**What Makes It Different**:  
Tone over balance; embraces humor.

**Child Forks**: Goob-Station (Piras314 variant)

---

#### **Nuclear-14** (Vault-Overseers/nuclear-14)
**Remote Name**: `nuclear-14`  
**GitHub**: https://github.com/Vault-Overseers/nuclear-14

**How it Plays**:  
Traditional station rounds with strong mapping identity.

**Niche / Theme**:  
Worldbuilding through maps and lore.

**What Makes It Different**:  
Map-driven design more than system-driven.

---

#### **White Dream** (WWhiteDreamProject/wwdpublic)
**Remote Name**: `white-dream`  
**GitHub**: https://github.com/WWhiteDreamProject/wwdpublic

**How it Plays**:  
Standard SS14 with lots of custom content.

**Niche / Theme**:  
Asset and content expansion.

**What Makes It Different**:  
Often used as a content donor for other forks.

---

#### **Cosmatic Drift** (cosmatic-drift-14/cosmatic-drift)
**Remote Name**: `cosmatic-drift`  
**GitHub**: https://github.com/cosmatic-drift-14/cosmatic-drift

**How it Plays**:  
Station gameplay with unique themes and assets.

**Niche / Theme**:  
Atmosphere-first customization.

**What Makes It Different**:  
Visual and thematic divergence more than mechanics.

---

#### **HardLight** (HardLightSector/HardLight)
**Remote Name**: `hardlight`  
**GitHub**: https://github.com/HardLightSector/HardLight

**How it Plays**:  
Experimental and uneven.

**Niche / Theme**:  
Prototype playground.

**What Makes It Different**:  
Tests ideas others won't risk upstream.

---

#### **Emberfall** (emberfall-14/emberfall)
**Remote Name**: `emberfall`  
**GitHub**: https://github.com/emberfall-14/emberfall

**How it Plays**:  
Heavily themed, slower, more deliberate.

**Niche / Theme**:  
Distinct aesthetic + mechanics.

**What Makes It Different**:  
Strong identity, small scope.

---

#### **Moff Station** (moff-station/moff-station-14)
**Remote Name**: `moff-station`  
**GitHub**: https://github.com/moff-station/moff-station-14

**How it Plays**:  
Standard station gameplay with niche tweaks.

**Niche / Theme**:  
Community-specific customization.

**What Makes It Different**:  
Low publicity, targeted changes.

---

#### **Space Syndicate** (space-syndicate/space-station-14)
**Remote Name**: `space-syndicate`  
**GitHub**: https://github.com/space-syndicate/space-station-14

*Note: Detailed description pending.*

---

#### **Deep Station 14** (SS14-Classic/deep-station-14)
**Remote Name**: `deep-station`  
**GitHub**: https://github.com/SS14-Classic/deep-station-14

**How it Plays**:  
Old-school SS13-feeling rounds.

**Niche / Theme**:  
Classic station gameplay.

**What Makes It Different**:  
Actively resists modern SS14 design trends.

---

#### **Harmony Station** (ss14-harmony/ss14-harmony)
**Remote Name**: `harmony-station`  
**GitHub**: https://github.com/ss14-harmony/ss14-harmony

**How it Plays**:  
Balanced MRP station rounds.

**Niche / Theme**:  
Stability and consistency.

**What Makes It Different**:  
Conservative changes, steady maintenance.

---

#### **RMC-14** (RMC-14/RMC-14)
**Remote Name**: `rmc-14`  
**GitHub**: https://github.com/RMC-14/RMC-14

A militaristic-themed fork likely emphasizing tactical gameplay and military-style roles/mechanics.

**Notable Features**: [Pending Research]  
**Current Status**: [Pending Research]

---

#### **Sunrise Station** (space-sunrise/sunrise-station)
**Remote Name**: `sunrise-station`  
**GitHub**: https://github.com/space-sunrise/sunrise-station

A fork that spawned two further variants (Lust Station and Fire Station).

**Notable Features**: [Pending Research]  
**Current Status**: [Pending Research]  
**Child Forks**: Lust Station, Fire Station

---

#### **Polonium Station** (polonium14/polonium-station)
**Remote Name**: `polonium-station`  
**GitHub**: https://github.com/polonium14/polonium-station

An independent fork focused on [**TO BE DOCUMENTED**].

**Notable Features**: [Pending Research]  
**Current Status**: [Pending Research]

---

#### **Trieste Port** (Pixeltheaertist/Trieste-Port-14)
**Remote Name**: `trieste-port`  
**GitHub**: https://github.com/Pixeltheaertist/Trieste-Port-14

A port/harbor-themed fork by a pixel artist, potentially emphasizing artistic/aesthetic elements.

**Notable Features**: [Pending Research]  
**Current Status**: [Pending Research]

---

### Tier 2: Secondary Forks (Forks of Major Forks)

#### **Far Horizons** (Far-Horizons-SS14/Far-Horizons-SS14)
**Remote Name**: `far-horizons`  
**Parent Fork**: Starlight  
**GitHub**: https://github.com/Far-Horizons-SS14/Far-Horizons-SS14

**How it Plays**:  
Like Starlight, but more curated and opinionated.

**Niche / Theme**:  
MRP with unique progression and tweaks.

**What Makes It Different**:  
Selective divergence instead of constant upstream syncing.

---

#### **Delta-V** (DeltaV-Station/Delta-v)
**Remote Name**: `deltav`  
**Parent Fork**: Nyanotrasen  
**GitHub**: https://github.com/DeltaV-Station/Delta-v

**How it Plays**:  
Chaotic, experimental, sometimes unbalanced.

**Niche / Theme**:  
"Let's try weird stuff and see if it works."

**What Makes It Different**:  
Fast iteration, bold mechanics, embraces instability.

---

#### **Parkstation** (Simple-Station/Parkstation)
**Remote Name**: `parkstation`  
**Parent Fork**: Nyanotrasen  
**GitHub**: https://github.com/Simple-Station/Parkstation

**How it Plays**:  
Roleplay-forward station rounds.

**Niche / Theme**:  
Character interaction over systems mastery.

**What Makes It Different**:  
Softer balance, RP-first decision making.

---

#### **Einstein Engines** (Simple-Station/Einstein-Engines)
**Remote Name**: `einstein-engines`  
**Parent Fork**: Nyanotrasen  
**GitHub**: https://github.com/Simple-Station/Einstein-Engines

**How it Plays**:  
Heavier, slower, more systemic SS14.

**Niche / Theme**:  
Engine-level experimentation + Baystation vibes.

**What Makes It Different**:  
Not just content — changes how SS14 works under the hood.

**Child Forks**: Hullrot

---

#### **Hullrot** (Sector-Crescent/Hullrot)
**Remote Name**: `hullrot`  
**Parent Fork**: Einstein Engines  
**GitHub**: https://github.com/Sector-Crescent/Hullrot

**How it Plays**:  
Ship-focused, exploration and combat oriented.

**Niche / Theme**:  
Spacefaring RP and ship conflict.

**What Makes It Different**:  
Built on Einstein assumptions, not WizDen ones.

---

#### **Monolith** (Monolith-Station/Monolith)
**Remote Name**: `monolith`  
**Parent Fork**: Frontier  
**GitHub**: https://github.com/Monolith-Station/Monolith

**How it Plays**:  
Aggressive PvP, piracy, ship combat.

**Niche / Theme**:  
Weaponized Frontier.

**What Makes It Different**:  
Leans hard into conflict and emergent chaos.

---

#### **Goob-Station (Piras314)** (Piras314/Goob-Station)
**Remote Name**: `goob-station-piras314`  
**Parent Fork**: Goob-Station  
**GitHub**: https://github.com/Piras314/Goob-Station

**How it Plays**:  
Like Goob, but more experimental.

**Niche / Theme**:  
Personal downstream experimentation.

**What Makes It Different**:  
Rapid changes without upstream consensus.

---

#### **Lust Station** (space-sunrise/lust-station)
**Remote Name**: `lust-station`  
**Parent Fork**: Sunrise Station  
**GitHub**: https://github.com/space-sunrise/lust-station

**How it Plays**:  
Mechanically normal SS14.

**Niche / Theme**:  
Adult / NSFW content.

**What Makes It Different**:  
Theme-only divergence.

---

#### **Fire Station** (space-sunrise/fire-station)
**Remote Name**: `fire-station`  
**Parent Fork**: Sunrise Station  
**GitHub**: https://github.com/space-sunrise/fire-station

**How it Plays**:  
Scenario-based rounds.

**Niche / Theme**:  
SCP / anomaly containment.

**What Makes It Different**:  
Mission-driven instead of sandbox chaos.

---

## Additional Notable Forks

These forks may not be set up as remotes yet, but are worth documenting:

#### **Civ14** (Not Yet Added as Remote)

**How it Plays**:  
Not a station at all.

**Niche / Theme**:  
Civilization / nation-building.

**What Makes It Different**:  
SS14 engine used as a platform, not a game.

---

#### **Ganimed14** (Not Yet Added as Remote)

**How it Plays**:  
Standard SS14, localized.

**Niche / Theme**:  
Russian community server.

**What Makes It Different**:  
Language and community focus.

---

## Git Remote Reference

All forks have been added as remotes to enable easy fetching and comparison. Use the "Remote Name" when running git commands.

**Common Commands**:
```bash
# Fetch latest from all remotes
git fetch --all

# Fetch from a specific fork
git fetch <remote_name>

# Compare master branch with a fork
git diff master <remote_name>/master

# View a fork's branch structure
git branch -r | grep <remote_name>

# Create a local branch tracking a fork's branch
git checkout --track <remote_name>/<branch_name>
```

---

## Feature Consolidation Strategy

### Phase 1: Research & Documentation
- [ ] Analyze each fork's unique features and mechanics
- [ ] Document major divergences from base WizDen
- [ ] Identify feature compatibility and conflicts
- [ ] Map feature dependencies

### Phase 2: Feature Extraction
- [ ] Extract compatible features from all forks
- [ ] Test feature isolation and integration
- [ ] Resolve conflicts and dependencies

### Phase 3: Integration
- [ ] Create feature branches for each fork's content
- [ ] Gradually integrate features into main branch
- [ ] Conduct testing after each integration

### Phase 4: Consolidation
- [ ] Finalize feature set
- [ ] Polish and optimize
- [ ] Create documentation for new features

---

## Notes

- This document is a living reference and will be updated as research on each fork progresses
- Feature compatibility will require careful testing due to potentially conflicting implementations
- Some forks may have diverged significantly from the base WizDen codebase
- Legal/licensing considerations should be reviewed for derivative works
- This project is for personal/fun use only

---

*Document created: January 14, 2026*
