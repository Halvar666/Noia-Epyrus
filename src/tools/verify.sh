#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
XPI="$ROOT/dist/Noia_Epyrus_1.0.0rc1.xpi"

[[ -f "$XPI" ]] || { echo "Missing build: $XPI" >&2; exit 1; }
unzip -tq "$XPI" >/dev/null

python3 - "$XPI" <<'PY2'
from pathlib import Path
import sys, zipfile, xml.etree.ElementTree as ET, re
xpi=Path(sys.argv[1])
with zipfile.ZipFile(xpi) as z:
    names=set(z.namelist())
    rdf=z.read('install.rdf')
    root=ET.fromstring(rdf)
    ns={'em':'http://www.mozilla.org/2004/em-rdf#'}
    desc=root.find('.//{http://www.w3.org/1999/02/22-rdf-syntax-ns#}Description')
    def val(tag):
        e=desc.find(f'em:{tag}', ns)
        return e.text if e is not None else None
    assert val('name') == 'Noia Epyrus', val('name')
    assert val('version') == '1.0.0rc1', val('version')
    app=desc.find('em:targetApplication', ns)
    ad=app.find('{http://www.w3.org/1999/02/22-rdf-syntax-ns#}Description')
    mn=ad.find('em:minVersion', ns).text
    mx=ad.find('em:maxVersion', ns).text
    assert mn == '2.2.1' and mx == '2.2.1', (mn,mx)

    manifest=z.read('chrome.manifest').decode('utf-8')
    skin_roots={}
    for raw in manifest.splitlines():
        s=raw.strip()
        if not s or s.startswith('#'): continue
        parts=s.split()
        if parts[0]=='skin' and len(parts)>=4:
            pkg, rel = parts[1], parts[3].rstrip('/')+'/'
            # All registered roots must physically exist in the archive.
            assert any(n.startswith(rel) for n in names), (pkg,rel)
            skin_roots[pkg]=rel
        elif parts[0]=='override' and len(parts)>=3:
            target=parts[2]
            m=re.match(r'chrome://([^/]+)/skin/(.+)$',target)
            if m:
                pkg, rel=m.groups()
                rootrel=skin_roots.get(pkg)
                # noiawin is registered before all generated overrides.
                assert rootrel is not None, ('unregistered override target package',pkg,target)
                assert rootrel+rel in names, ('missing override target',target,rootrel+rel)

    # Optimized architecture invariants.
    assert not any(n.startswith('linux/') for n in names)
    assert not any(n.startswith('windows/') for n in names)
    assert any(n.startswith('core/messenger/') for n in names)
    assert any(n.startswith('windows-delta/messenger/') for n in names)

    forbidden=[n for n in names if n.startswith('README-Noia-Fox-Epyrus-a') or n in {'BUILD_REPORT.txt','NATIVE_BASELINE_ADDED.txt'}]
    assert not forbidden, 'Development artifacts present: ' + repr(forbidden)
    for required in ['LICENSE','CREDITS.md','MODIFICATIONS.md','SOURCE.txt']:
        assert required in names, required
print('XPI verification OK')
PY2

(cd "$ROOT/dist" && sha256sum -c "Noia_Epyrus_1.0.0rc1.sha256")
