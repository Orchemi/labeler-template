# labeler template

## 제작 배경

[GitHub Actions Labeler로 Label 자동화](http://blog.huns.site/blog/posts/dev/research/github-labeler-automation?utm_source=reference&utm_medium=github&utm_campaign=labeler-template) 포스트를 작성하던 중, 새 프로젝트 시작 시에 label을 준비하거나 labeler를 설정하는 과정을 쉽게 할 수 있으면 좋겠다고 생각했습니다.

<br />

## 설정 과정

### create-labels.sh 설정

> [!INFO]
> macOS와 brew를 사용합니다.

GitHub API를 활용해 GitHub Project에 원하는 Label을 생성하는 shell script입니다.

<br />

#### 1. shell script 준비

[create-labels.sh](/scripts/create-labels.sh)를 복사해 프로젝트에 추가합니다.

<br />

#### 2. Customization

- 부착되는 label의 이름과 이모지, 색상과 설명 등을 원하는대로 수정합니다.
- 조건에서 `files`의 디렉토리, 파일 확장자 등을 프로젝트에 맞게 수정합니다.

<br />

#### 3. GitHub CLI 설치 및 로그인

```bash
# GitHub CLI 설치
brew install gh

# GitHub 로그인
gh auth login
```

Web UI를 사용해 로그인하는 게 편하기 때문에 아래와 같은 옵션을 선택해 로그인하시면 됩니다.

```bash
> gh auth login
? Where do you use GitHub? GitHub.com
? What is your preferred protocol for Git operations on this host? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? Login with a web browser

! First copy your one-time code: 6E83-3946
Press Enter to open https://github.com/login/device in your browser...
✓ Authentication complete.
- gh config set -h github.com git_protocol https
✓ Configured git protocol
✓ Logged in as (user-name)
```

<br />

#### 4. shell script 실행

```bash
# 실행권한 부여
chmod +x scripts/create-labels.sh

# 코드 실행
./scripts/create-labels.sh
```

참고로 script를 실행하면 이런 게 나올텐데 이 상태를 나가는 단축키는 `q`입니다.

- 참고 문서: [huns-log : GitHub API로 Label 생성](http://blog.huns.site/blog/posts/dev/research/github-labeler-automation?utm_source=reference&utm_medium=github&utm_campaign=labeler-template#github-api%EB%A1%9C-label-%EC%83%9D%EC%84%B1)

```bash
{
  "id": ...,
  "node_id": "...",
  "url": "https://api.github.com/repos/(user-name)/(repository-name)/labels/✨feature",
  "name": "✨feature",
  "color": "60A5FA",
  "default": false,
  "description": "기능 신규 추가"
}
(END)
```

<br />

### labeler yaml 파일 이전

아래 3개의 파일을 디렉토리까지 똑같이 프로젝트로 옮겨주세요.

- `.github/workflows/pr_labeler.yml` : pull request 관련 labeler 코드입니다.
- `.github/workflows/issue_labeler.yml` : issue 관련 labeler 코드입니다.
- `.github/labeler.yml` : label 부착 조건 관련 핵심 코드입니다.

<br />

### Customization

- 위의 `create-labels.sh`에서 label 정보를 수정했다면, `labeler.yml`의 label 이름도 동기화하여 수정합니다.
- 그렇지 않으면 다른 label로 인식하여 불필요한 label이 생성될 수 있습니다.

<br />

## 참고 문서

srvaroa/labeler에 대해서 더 자세히 알고 싶으신 분들은 아래 문서를 참고하세요.

- [huns-log : labeler.yml](http://blog.huns.site/blog/posts/dev/research/github-labeler-automation?utm_source=reference&utm_medium=github&utm_campaign=labeler-template#labeleryml)
- [srvaroa/labeler](https://github.com/srvaroa/labeler)
