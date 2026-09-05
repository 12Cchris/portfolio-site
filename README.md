# Personal Workshop Log

필요해서 만든 개인 프로그램들을 한 페이지에 모아 보여주는 포트폴리오 사이트입니다.
빌드 도구 없이 `index.html` 파일 하나로 동작하는 정적 사이트예요.

## 미리보기

로컬에서는 `index.html`을 브라우저로 더블클릭해서 열면 대부분 그대로 보입니다.
(단, ADMIN 화면의 "GitHub에 저장하고 배포" 기능은 `file://`로 열면 일부 브라우저에서
막힐 수 있어, GitHub Pages로 배포한 뒤 실제 주소에서 쓰는 걸 추천합니다.)

## 배포 (GitHub Pages)

1. 이 파일을 GitHub 저장소에 `index.html`이라는 이름으로 올립니다.
2. 저장소 **Settings → Pages**에서 Source를 `Deploy from a branch`,
   브랜치는 `main`, 폴더는 `/ (root)`로 설정하고 저장합니다.
3. 잠시 후 `https://<아이디>.github.io/<저장소이름>/` 주소로 접속할 수 있습니다.
4. 이후에는 저장소에 새 커밋만 올리면 자동으로 다시 배포됩니다.

## 프로젝트 추가하는 법

두 가지 방법이 있습니다.

**방법 A. 사이트의 ADMIN 화면 사용 (코드 수정 없이)**
사이트 상단의 **ADMIN** 메뉴에서 GitHub 연결 정보와 Personal Access Token을 입력하면,
프로젝트를 추가·수정·삭제하고 버튼 한 번으로 바로 GitHub에 커밋할 수 있습니다.
자세한 안내는 ADMIN 화면 안에 함께 적혀 있습니다.

**방법 B. 코드 직접 수정**
`index.html`을 열어 `PROJECTS_DATA_START` ~ `PROJECTS_DATA_END` 마커 사이의
`PROJECTS` 배열에 객체를 하나 추가하면 카드가 자동으로 생깁니다. 각 필드 설명은
그 위 주석에 적혀 있습니다.

- ADMIN 화면으로 저장하든, 코드를 직접 고쳐서 커밋하든 결과는 동일합니다
  (같은 `PROJECTS_DATA_START` ~ `PROJECTS_DATA_END` 영역을 사용합니다).
- 두 방법을 섞어 써도 되지만, ADMIN 화면은 항상 GitHub에 있는 최신 파일을
  기준으로 편집하는 것이 아니라 **화면을 열 때 로드된 내용을 기준으로 편집**하므로,
  코드를 직접 고친 직후에는 ADMIN 화면을 새로고침한 뒤 사용하는 걸 권장합니다.

## 아이콘 추가하는 법

`icon` 필드에 내장 아이콘 이름(`clock`, `music`, `wallet`, `code`, `star`, `folder`,
`chart`, `lock`, `phone`, `bell`, `globe`) 외의 이름을 적으면,
[lucide.dev/icons](https://lucide.dev/icons)에서 같은 이름의 아이콘을 자동으로 가져와
표시합니다. 예: `icon: "rocket"`

## 상태(status) 값 추가/변경

`STATUS_CONFIG` 객체에서 상태 key·라벨·색상을 관리합니다. 새 상태가 필요하면
이 객체에 한 줄만 추가하면 됩니다. (`index.html` 안 주석 참고)

## 관리자(ADMIN) 도구에 대한 주의사항

- ADMIN 화면은 비밀번호로 잠겨 있습니다. 처음 접속하면 비밀번호를 직접 정하게 되고,
  이후에는 그 비밀번호를 입력해야 화면이 열립니다. **이 비밀번호는 파일이나 GitHub에는
  저장되지 않고, 이 브라우저의 로컬 저장소에만 남습니다** (해시로 저장됨). 탭을 새로고침하면
  다시 잠깁니다.
- 다만 이 비밀번호는 정적 사이트 특성상 완전한 보안이 아니라 **가벼운 잠금장치**입니다.
  실제 방어선은 GitHub 토큰이며, 비밀번호는 화면을 우연히/실수로 여는 것을 막는 용도입니다.
- GitHub Personal Access Token은 이 브라우저의 로컬 저장소에만 저장되며,
  GitHub API로만 직접 전송됩니다. 다른 사람의 기기나 공용 컴퓨터에는 입력하지 마세요.
- 토큰은 이 저장소에 대해 **Contents: Read and write** 권한만 준
  Fine-grained personal access token으로 새로 발급해서 쓰는 걸 추천합니다.
- 저장소를 Private으로 바꿔도 배포된 사이트 자체는 누구나 볼 수 있는 공개 페이지입니다
  (정적 사이트라 페이지 소스가 그대로 노출됩니다). Private 저장소에서 GitHub Pages를
  쓰려면 GitHub Pro 이상 유료 플랜이 필요합니다.
