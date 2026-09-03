# Repository / release checklist

Suggested first public repository setup for Noia Epyrus:

- Repository name: `Noia-Epyrus`
- Default branch: `main`
- License: Mozilla Public License 1.1
- Initial release/tag: `1.0.0rc1`
- Canonical XPI size: `4,665,742 bytes (4.45 MiB)`
- Canonical XPI SHA256: `1d63ca7561ed5c4e08ce97cfa1ba375ddecc50a11da72d19f14874ecd98f0884`
- Attach to the release:
  - `Noia_Epyrus_1.0.0rc1.xpi`
  - `Noia_Epyrus_1.0.0rc1.sha256`
  - `Noia_Epyrus_1.0.0rc1_source.zip`
- Use `Noia_Epyrus_1.0.0rc1_RELEASE_NOTES.md` as the release description.
- Keep source available with the binary release, as required by the MPL 1.1 distribution terms.
- Before a final `1.0.0` release, retest both Linux and Windows with Menu Bar on/off, main mail window, Compose, Address Book, Add-ons Manager and Calendar/Tasks.

Suggested initial Git commands after creating an empty remote repository:

```bash
git init
git add .
git commit -m "Noia Epyrus 1.0.0rc1"
git branch -M main
git remote add origin <repository-url>
git push -u origin main
git tag 1.0.0rc1
git push origin 1.0.0rc1
```

## Platform layout

- [ ] `src/core/` is the canonical tested Linux runtime tree.
- [ ] `src/windows-delta/` contains only files that differ on Windows or exist only on Windows.
- [ ] Windows overrides reconstruct the tested Windows tree.
- [ ] No duplicated full `linux/` and `windows/` runtime trees are present.
