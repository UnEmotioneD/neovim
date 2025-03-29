# Neovim 설정

- [설치전 작업](#설치전-작업)

  - [니오빔 설치](#니오빔-설치)
  - [필요한 의존 프로그램](#필요한-의존-프로그램)
  - [리포 클론](#리포지토리-클론)
  - [현재 리포 같이 쓰기](#현재-리포를-기본-설정과-같이-쓰기)

- [파일 구조](#파일-구조)

- [나의 Neovim 설명](#나의-neovim-설명)

  - [LSP](#lsp-language-server-protocol)
  - [Plugins](#plugins)

- [다른 nvim config 또는 distro](#다른-nvim-config-또는-distro)

- [다른 에디터 또는 IDE에서 vim-motion 사용하기](#다른-에디터-또는-ide에서-vim-motion-사용하기)

## 참고한 유튜브 영상

- [드림코딩](https://www.youtube.com/watch?v=cY0JxzENBJg&t=39s&pp=ygUNdmltIOyCrOyaqeuylQ%3D%3D)
- [Josean Martinez](https://www.youtube.com/watch?v=6pAG3BHurdM&pp=ygULam9zZWFuIG52aW0%3D)
- [TJ DeVries](https://www.youtube.com/watch?v=m8C0Cq9Uv9o&pp=ygUHdGogbnZpbQ%3D%3D)

## 설치전 작업

### 니오빔 설치

- 해당 Distro의 페키지 매니저로 `nvim`을 설치한다
  - Kali: `sudo apt install nvim`

### Source 로 부터 Build

- 패키지 메니저로 설치 했을때 최신 버젼이 아닐 수 있음

<details>
  <summary>확장하기</summary>

</details>

### 필요한 의존 프로그램

- git
- nerd fonts (아이콘)
- fzf (Telescope 기능에 필요)
- ripgrep (Telescope live_grep 기능에 필요)
- lazygit
- node.js (LSP 설치)
- pnpm (live-server 설치)
- yarn (markdown-preview 설치)
- tree-sitter-cli

---

- `Rust` 설치하기
  - [rust-lang](https://www.rust-lang.org/tools/install)

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

- `Cargo`를 이용해서 `tree-sitter-cli` 설치
  - [tree-sitter/tree-sitter](https://github.com/tree-sitter/tree-sitter)

```sh
cargo install --locked tree-sitter-cli
```

---

- `Kali` 리눅스

- nodejs, npm(node.js 설치하면 자동으로 설치됨) 설치

```sh
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
```

- pnpm 설치

```sh
sudo npm install -g pnpm
```

- `pnpm`을 사용할 수 있도록 설정

```sh
pnpm setup
```

- `pnpm` 설정이 `~/.bashrc` 또는 `~/.zshrc`에 적용 되었고 새로고침을 해준다

```sh
source ~/.zshrc
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

- 기존 nvim 경로가 없다면 생성해준다

```sh
mkdir -p ~/.config/nvim
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

- ex) 클론을 `~/.config/daniel` 경로에 했다면 다음 명령어를 사용해서 다른 설정의 `nvim` 사용 가능

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
~/.config
   └── nvim
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

## 나의 Neovim 설명

### Options

---

### Keymaps

---

### LSP (Language Server Protocol)

---

#### LSP 란?

- 에디터를 `Language Server`와 연결해 줘서 자동완성, syntax-highlighting, 에러 파악
  등의 기능을 제공한다

---

- Lua

  - lua_ls
  - stylua

  ***

- HTML, CSS, JavaScript

  - html
  - cssls
  - ts_ls
  - emmet_ls
  - prettier
  - eslint_d

  ***

- C, C++

  - clangd
  - cpplint
  - clang-format

  ***

- Python

  - ruff

  ***

- Markdown

  - marksman
  - markdownlint

  ***

- Toml

  - taplo

  ***

- 철자

  - typos_lsp

---

### Plugins

#### Lazy 플러그인 매니저

---

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
- [render-markdown](#render-markdown)
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

- [`patorjk.com`](https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=netblock)에서 `header`에 보여줄 ASCII Art를 바꿀 수 있음

- `button`에서 보여주는 키를 `Alpha` 창에서 입력하면 원래 키맵과 다르게 기능을 실행 할 수 있다

- `:Alpha` 명령어를 사용해서 현재 창에서 보여줄 수도 있다

#### auto-session

- [rmagatti/auto-session](https://github.com/rmagatti/auto-session)

- 해당 경로의 열려있는 파일, 창 등을 자동으로 저장하고 복원 할 수 있다

#### bigfile

- [LunarVim/bigfile.nvim](https://github.com/LunarVim/bigfile.nvim)

- 파일이 특정 크기 이상일때 일부 기능들을 꺼준다

#### comment

- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

- 향상된 주석 기능

#### conform

- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)

- 향상된 포멧(띄어쓰기, 들여쓰기, 줄바꾸기) 기능

#### dressing

- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim)

- 향상된 UI

#### flash

- [folke/flash.nvim](https://github.com/folke/flash.nvim)

- 향상된 화면 내에서의 커서 이동

#### gitsigns

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

- Buffer에서의 git 상태를 gutter(line-number 옆)에서 보여준다

#### harpoon

- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)

- 향상된 파일간 이동

#### lazygit

- [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

- Neovim 화면에서 LazyGit을 불러옴

#### live-server

- [barrett-ruth/live-server.nvim](https://github.com/barrett-ruth/live-server.nvim)

- `npm` 페키지 `live-server`를 사용해서 html, css, javascript 파일 미리보기

#### lualine

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

- Status bar

#### markdown-preview

- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

- Markdown 파일 미리보기 기능 제공

#### marks

- [chentoast/marks.nvim](https://github.com/chentoast/marks.nvim)

- Gutter(line-number 옆)에 마크를 보여줌

#### mini-icon

- [echasnovski/mini.icons](https://github.com/echasnovski/mini.icons)

- Nvim에서 보여줄 아이콘 제공

#### no-neck-pain

- [shortcuts/no-neck-pain.nvim](https://github.com/shortcuts/no-neck-pain.nvim)

- Buffer 중앙 정렬 기능

#### nvim-autoparis

- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)

- 여는 따옴표, 괄호 등을 자동으로 닫아줌

#### nvim-cmp

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

- 자동 완성 엔진

#### nvim-colorizer

- [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)

- Virtual-text를 만들어서 색깔을 보여줌

#### nvim-hlslens

- [kevinhwang91/nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)

- Buffer 내에서 검색 결과를 보여줄때 더 많은 기능을 제공

#### nvim-lint

- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)

- Lint: 코드의 경고, 에러 등을 보여줌

#### nvim-surround

- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)

- 문자 쌍 또는 HTML 태그를 추가/삭제/변경 기능

#### nvim-tree

- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

- Neovim에서 VSCode 같은 파일 탐색기를 제공

#### nvim-treesitter

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

- 향상된 syntax-highlight 기능

#### oil

- [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)

- 파일 시스템을 일반 Neovim buffer 처럼 변집 할 수 있는 기능

#### plenary

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

- Neovim 플러그인을 개발하는데 필수적인 function들을 제공하는 라이브러리

#### render-markdown

- [render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)

- 향상된 markdown 파일 보여주는 기능

#### tabout

- [abecodes/tabout.nvim](https://github.com/abecodes/tabout.nvim)

- Tab 키를 이용해서 점, 따옴표, 괄호 등을 뛰어 넘을 수 있는 기능 제공

#### telescope

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

- Neovim 내에서 파일, 문자 등을 검색 할 수 있는 기능 제공

#### todo-comments

- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

- 주석으로 되어 있는 TODO, NOTE 등의 단어들을 강조

#### tokyonight

- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

- A color scheme

#### trouble

- [folke/trouble.nvim](https://github.com/folke/trouble.nvim)

- 코드 진단, `telescope` 검색 결과 등을 보여주는 리스트

#### undotree

- [mbbill/undotree](https://github.com/mbbill/undotree)

- 뒤로가기 기록을 나무 형식으로 보여주는 기능

#### vim-maximizer

- [szw/vim-maximizer](https://github.com/szw/vim-maximizer)

- 창을 분할 했을때 최대화/복구 하는 기능 제공

#### vim-tmux-navigator

- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

- TMUX와 Neovim의 window 또는 pane들을 편하게 이동할 수 있는 기능 제공

#### which-key

- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

- 팝업창으로 사용가능한 키맵들을 보여준다

---

### 다른 Nvim config 또는 distro

- [kickstart](https://github.com/nvim-lua/kickstart.nvim)
- [AstroNvim](https://astronvim.com/)
- [LazyVim](https://www.lazyvim.org/)
- [NvChad](https://nvchad.com/)

---

### 다른 에디터 또는 IDE에서 vim-motion 사용하기

- Visual Studio: [`VsVim`](https://marketplace.visualstudio.com/items?itemName=JaredParMSFT.VsVim)
- Visual Studio Code: [`Vim`](https://github.com/VSCodeVim/Vim) 또는 [`VSCode Neovim`](https://github.com/vscode-neovim/vscode-neovim)
- Eclipse IDE: [`Vrapper`](https://vrapper.sourceforge.net/home/), `ScrollOffset`, `Relative Line Number Ruler`
- JetBrains IDE: [`IdeaVim`](https://plugins.jetbrains.com/plugin/164-ideavim)

---

#### Happy Ricing 🎉
