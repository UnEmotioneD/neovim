# Neovim 설정

- [설치전 작업](#설치전-작업)
  - [니오빔 설치](#니오빔-설치)
  - [필요한 의존 프로그램](#필요한-의존-프로그램)
  - [리포 클론](#리포지토리-클론)
  - [현재 리포 같이 쓰기](#현재-리포를-기본-설정과-같이-쓰기)
- [파일 구조](#파일-구조)
- [플러그인 설명](#플러그인-설명)
  - [LSP](#lsp)
  - [Plugins](#plugins)

## 참고한 유튜브 영상

- [Josean Martinez](https://www.youtube.com/watch?v=6pAG3BHurdM&pp=ygULam9zZWFuIG52aW0%3D)
- [TJ DeVries](https://www.youtube.com/watch?v=m8C0Cq9Uv9o&pp=ygUHdGogbnZpbQ%3D%3D)

## 설치전 작업

### 니오빔 설치

- Distro의 페키지 매니저로 `nvim` 설치한다

---

### 필요한 의존 프로그램

- git
- nerd fonts
- node.js
- pnpm
- yarn
- cargo
- treesitter-cli
- lazygit
- fcitx5

---

- For Kali linux

```sh
sudo apt install
```

- For Arch linux

```sh
sudo pacman -S
```

---

### 리포지토리 클론

- 설정의 기본 경로는 `~/.config/nvim`에 있다

```sh
cd ~/.config
```

- 이미 있는 설정 파일 백업
- `mv(move)`로 이름 변경

```sh
mv nvim nvim.bak
```

- 이미 있는 플러그인, 케쉬 삭제

```sh
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

- 현재 리포에 있는 파일들을 `~/.config/nvim`경로 밑으로 클론

```sh
git clone https://github.com/UnEmotioneD/neovim.git ~/.config/nvim
```

- 니오빔 시작

```sh
nvim
```

- 기본 설정 니오빔 시작

```sh
nvim --clean
```

---

### 현재 리포를 기본 설정과 같이 쓰기

- 예시) 클론을 `~/.config/daniel` 경로에 했다면

- 다음 명령어를 사용해서 다른 설정의 `nvim` 사용 가능

```sh
NVIM_APPNAME=daniel nvim
```

- `~/.bashrc` 또는 `~/.zshrc`에 별칭을 추가해서 사용할 수도 있다

```sh
alias dvim="NVIM_APPNAME=daniel nvim"
```

---

## 파일 구조

```css
nvim
├── ftplugin
├── lua
│   └── unemotioned
│       ├── core
│       ├── plugins
│       │   └── lsp
│       └── lazy.lua
├── spell
├── typos
├── init.lua
└── lazy-lock.json
```

## 플러그인 설명

### LSP

---

### Plugins

---

#### Happy hacking 🎉
