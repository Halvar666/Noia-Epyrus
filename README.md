# Noia Epyrus

Noia Epyrus is a complete theme for **Epyrus 2.2.1** that brings the visual style of the classic **Noia Fox** theme to the modern native Epyrus theme structure.

The project does **not** use ClassicTB2 as its structural base. The runtime skeleton comes from the default Epyrus 2.2.1 theme, with a shared Epyrus/Noia core and a compact Windows delta layer. Noia Fox styling and artwork are layered onto the native Epyrus structure so platform-specific frame, toolbar, menu, tab and widget behavior remains compatible without storing two near-identical complete skin trees.

## Status

Current release candidate: **1.0.0rc2**

Test target:

- Epyrus 2.2.1, Linux x86_64 GTK3
- Epyrus 2.2.1, Windows 64-bit

Compatibility is intentionally restricted to Epyrus **2.2.1** until later Epyrus versions are explicitly tested.

Canonical 1.0.0rc2 release artifact:

- XPI size: **4,667,623 bytes (4.45 MiB)**
- SHA256: `945213e6071bf5c687310451913b77290d12fcc1b44b2e4738658369625de05e`

## Highlights

- Noia Fox visual style and large colored toolbar icons.
- Curved Australis-style Noia tabs.
- Native Epyrus 2.2.1 application structure.
- Shared cross-platform core with Windows-only delta overrides.
- Native Windows titlebar/AppMenu handling with Noia visual integration.
- 32 px main-toolbar icons and 24 px small-toolbar icons.
- Calendar/Lightning, Address Book, Compose, Add-ons Manager and other Epyrus UI coverage.
- Epyrus-specific compatibility fixes retained without using an obsolete Thunderbird theme skeleton.

## Installation

1. Open Epyrus.
2. Open **Tools → Add-ons → Appearance**.
3. Install the `Noia_Epyrus_1.0.0rc2.xpi` file.
4. Activate **Noia Epyrus** and restart Epyrus if requested.

## Repository layout

- `src/core/` — shared runtime skin (the tested Linux tree).
- `src/windows-delta/` — only files that differ on Windows or exist only there.
- `src/common/` — shared auxiliary Noia/Epyrus packages.
- `tools/build.sh` — reproducible XPI build helper.
- `tools/verify.sh` — package and metadata checks.
- `CHANGELOG.md` — release history.
- `MODIFICATIONS.md` — derivative-work and porting record required for the MPL 1.1 source distribution.
- `CREDITS.md` — upstream authors and contributors.
- `LICENSE` — Mozilla Public License 1.1.

## Building

See [BUILDING.md](BUILDING.md), or run:

```bash
./tools/build.sh
./tools/verify.sh
```

The resulting XPI and SHA256 file are written to `dist/`.

## Origin and credits

Noia Epyrus is derived from **Noia Fox 3.1.5** by **David Vincent**, which was published as a theme for Firefox and Thunderbird and is based on the **Noia Iconpack by Carlitus**.

Original Noia Fox listing:

https://addons.thunderbird.net/en-US/thunderbird/addon/noia-fox/

See [CREDITS.md](CREDITS.md) and [MODIFICATIONS.md](MODIFICATIONS.md) for details.

## License

The upstream Noia Fox listing identifies the theme/source as released under the **Mozilla Public License Version 1.1**. Noia Epyrus is distributed under the same license for the covered derivative work. Inherited Mozilla/Epyrus source files may also contain their original MPL/GPL/LGPL tri-license notices; those notices are preserved.

See [LICENSE](LICENSE).
