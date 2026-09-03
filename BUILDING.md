# Building Noia Epyrus

## Requirements

A POSIX shell environment with:

- `bash`
- `zip`
- `unzip`
- `sha256sum`
- `python3`

The build does not compile code. It packages the complete-theme source tree into an XPI archive.

## Build

From the repository root:

```bash
./tools/build.sh
```

Output:

- `dist/Noia_Epyrus_1.0.0rc1.xpi`
- `dist/Noia_Epyrus_1.0.0rc1.sha256`

The helper uses a fixed default `SOURCE_DATE_EPOCH` for the rc1 release so repeated builds from identical source content produce stable archive timestamps. Override `SOURCE_DATE_EPOCH` if needed.

## Reference rc1 artifact

A clean build from this source tree must reproduce:

- XPI size: **4,665,742 bytes (4.45 MiB)**
- SHA256: `1d63ca7561ed5c4e08ce97cfa1ba375ddecc50a11da72d19f14874ecd98f0884`

If either value differs, verify that the compact `core/` + `windows-delta/` source layout is being built and that no older full `linux/` / `windows/` trees were reintroduced.

## Verify

```bash
./tools/verify.sh
```

The verification script checks:

- XPI/ZIP integrity.
- `install.rdf` XML validity.
- release name and version.
- Epyrus 2.2.1 min/max compatibility.
- presence of all paths registered by `chrome.manifest`, including Windows delta override targets.
- optimized layout invariants (`core/` plus `windows-delta/`, with no duplicated full platform trees).
- absence of development alpha reports and intermediate README files.
