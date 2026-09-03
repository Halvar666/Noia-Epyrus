# Changelog

All notable public changes to Noia Epyrus are documented here.

## 1.0.0rc2 — 2026-09-03

Second public release candidate.

- Fixed invisible Windows minimize/maximize/restore/close glyphs when the Menu Bar is hidden by serving `caption-buttons.svg` directly from the shared messenger skin instead of through a Windows override.
- Replaced the orange Firefox-era Windows AppMenu button with a blue Pale Moon-style gradient, including hover and pressed/open states.
- Preserved native Epyrus Windows titlebar geometry and AppMenu behavior.
- Retained the compact shared-core + Windows-delta package layout.

## 1.0.0rc1 — 2026-09-03

First public release candidate.

- Ported the Noia Fox visual design to the native Epyrus 2.2.1 complete-theme skeleton.
- Added a shared runtime core with compact Windows-only platform deltas.
- Preserved Noia curved/Australis tab styling.
- Preserved large Noia toolbar icon presentation.
- Fixed Windows hidden-menubar/titlebar and AppMenu integration.
- Fixed Windows main-toolbar icon sizing.
- Retained Calendar/Lightning and Epyrus-specific compatibility work.
- Removed redundant duplicate Linux/Windows files from the release package while preserving the tested platform-specific output.
- Cleaned development-only alpha artifacts from the distributable package.
- Added repository-ready documentation, licensing, credits and build scripts.
