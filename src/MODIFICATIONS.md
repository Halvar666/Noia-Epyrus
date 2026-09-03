# Modifications and derivative-work notice

Noia Epyrus is derived directly and indirectly from **Noia Fox 3.1.5 by David Vincent** and from the native default theme code/assets shipped with **Epyrus 2.2.1**.

This file documents the principal modifications made for the Noia Epyrus derivative work, in accordance with the source-distribution requirements of Mozilla Public License Version 1.1.

## 2026-09-03 — Noia Epyrus 1.0.0rc1

- Renamed the Epyrus port for release as **Noia Epyrus**.
- Reset public versioning to **1.0.0rc1**.
- Rebuilt the theme architecture around the exact native Epyrus 2.2.1 default theme structure rather than an obsolete Thunderbird/ClassicTB2 skeleton.
- Uses the tested Linux runtime skin as a shared canonical core.
- Stores only the actual Windows file deltas and selects them with conditional `chrome.manifest` overrides, preserving native Windows behavior without duplicating more than one thousand identical files.
- Preserved shared/common auxiliary packages where appropriate.
- Retained Noia Fox visual styling, artwork and curved Australis-style tabs.
- Retained Noia visual mappings for mail, compose, address book, calendar/tasks and related UI surfaces.
- Integrated Epyrus-specific controls and fallbacks that do not exist in the original Noia Fox package.
- Restored native Windows frame/titlebar/AppMenu behavior while keeping Noia styling.
- Restored Noia main-toolbar icon sizing on Windows: 32 px normal and 24 px small.
- Adjusted the Windows AppMenu footprint so the native window title no longer overlaps the button.
- Removed development-only alpha reports and intermediate README files from the release package.
- Added repository documentation, build helpers, checksums and explicit upstream attribution.

The release candidate is intentionally targeted only at Epyrus 2.2.1 until later application versions are audited and tested.
