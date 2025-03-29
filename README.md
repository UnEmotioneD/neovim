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
  - Kali: `sudo apt install nvim`
  - Arch: `sudo pacman -S nvim`

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

---

- `Kali` 리눅스

```sh
sudo apt install
```

- `Arch` 리눅스

```sh
sudo pacman -S
```

---

### 리포지토리 클론

- 설정의 기본 경로는 `~/.config/nvim`에 있다

```sh
cd ~/.config
```

- 이미 있는 설정 파일을 `mv(move)`로 이름 변경 하여 백업

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

- 아무런 설정 없는 니오빔 시작

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

```sh
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

---

## 플러그인 설명

### LSP

---

### Plugins

- [alpha](#alpha)
- [auto-session](#auto-session)
- [bigfile](#bigfile)
- [comment](#comment)
- [conform](#conform)
- [dressing](#dressing)
- [flash](#flash)
- [gitsigns](#gitsigns)
- [harpoon](#harpoon)
- [lazygit](#lazygit)
- [live-server](#live-server)
- [lualine](#lualine)
- [markdown-preview](#markdown-preview)
- [marks](#marks)
- [mini-icon](#mini-icon)
- [no-neck-pain](#no-neck-pain)
- [nvim-autoparis](#nvim-autoparis)
- [nvim-cmp](#nvim-cmp)
- [nvim-colorizer](#nvim-colorizer)
- [nvim-hlslens](#nvim-hlslens)
- [nvim-lint](#nvim-lint)
- [nvim-surround](#nvim-surround)
- [nvim-tree](#nvim-tree)
- [nvim-treesitter](#nvim-treesitter)
- [oil](#oil)
- [plenary](#plenary)
- [tabout](#tabout)
- [telescope](#telescope)
- [todo-comments](#todo-comments)
- [tokyonight](#tokyonight)
- [trouble](#trouble)
- [undotree](#undotree)
- [vim-maximizer](#vim-maximizer)
- [vim-tmux-navigator](#vim-tmux-navigator)
- [which-key](#which-key)

---

#### alpha

- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)

- `nvim` 명령어로 시작했을때 커스텀한 화면을 보여줌

- 다음 사이트에서 `header` 에서 보여줄 ASCII 아트를 바꿀 수 있음

  - [patorjk](https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=netblock)

- `button`에서 보여주는 키를 입력하면 원래 키맵과 다르게 명령어를 실행 할 수 있다

- `:Alpha` 명령어를 사용해서 현재 창에서 보여줄 수도 있다

#### auto-session

#### bigfile

#### comment

#### conform

#### dressing

#### flash

#### gitsigns

#### harpoon

#### lazygit

#### live-server

#### lualine

#### markdown-preview

#### marks

#### mini-icon

#### no-neck-pain

#### nvim-autoparis

#### nvim-cmp

#### nvim-colorizer

#### nvim-hlslens

#### nvim-lint

#### nvim-surround

#### nvim-tree

#### nvim-treesitter

#### oil

#### plenary

#### tabout

#### telescope

#### todo-comments

#### tokyonight

#### trouble

#### undotree

#### vim-maximizer

#### vim-tmux-navigator

#### which-key

---

##### Happy hacking 🎉
