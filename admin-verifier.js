/* admin-verifier.js v1.0.0
   관리자 비밀번호 검증값만 담은 파일입니다. index.html과 같은 폴더에 두세요.
   - 비밀번호 원문이 아니라 솔트+PBKDF2(60만 회)로 만든 검증값입니다.
   - index.html을 새로 받아 덮어써도 이 파일은 그대로 두면 됩니다.
   - 비밀번호를 바꿀 때만 make-password-hash.html로 만든 값으로 아래 한 줄을 교체하세요.
   형식: { s: "솔트(base64)", i: 반복횟수, h: "해시(hex)" } */
window.ADMIN_PASS_VERIFIER = { s: "P74xNI34lmVVdEi5P4pMdw==", i: 600000, h: "93656a8fbef616583a4931dfc146936f5cc0791bc7a778eb5dcc3c502b5ad46b" };
