# Repository / release checklist

Release checklist for Noia Epyrus 1.0.0rc2:

- Repository name: `Noia-Epyrus`
- Default branch: `main`
- License: Mozilla Public License 1.1
- Release/tag: `1.0.0rc2`
- Canonical XPI size: `4,667,623 bytes (4.45 MiB)`
- Canonical XPI SHA256: `945213e6071bf5c687310451913b77290d12fcc1b44b2e4738658369625de05e`
- Attach to the release:
  - `Noia_Epyrus_1.0.0rc2.xpi`
  - `Noia_Epyrus_1.0.0rc2.sha256`
  - `Noia_Epyrus_1.0.0rc2_source.zip`
- Use `Noia_Epyrus_1.0.0rc2_RELEASE_NOTES.md` as the release description.
- Keep source available with the binary release, as required by the MPL 1.1 distribution terms.
- Before a final `1.0.0` release, retest both Linux and Windows with Menu Bar on/off, main mail window, Compose, Address Book, Add-ons Manager and Calendar/Tasks.

Suggested initial Git commands after creating an empty remote repository:

```bash
git init
git add .
git commit -m "Noia Epyrus 1.0.0rc2"
git branch -M main
git remote add origin <repository-url>
git push -u origin main
git tag 1.0.0rc2
git push origin 1.0.0rc2
```

## Platform layout

- [ ] `src/core/` is the canonical tested Linux runtime tree.
- [ ] `src/windows-delta/` contains only files that differ on Windows or exist only on Windows.
- [ ] Windows overrides reconstruct the tested Windows tree.
- [ ] No duplicated full `linux/` and `windows/` runtime trees are present.
