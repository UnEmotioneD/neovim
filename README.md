# Neovim 설정

- [설치 전 작업](#설치-전-작업)

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

---

## TODO

- [ ] 칼리 리눅스에서 nerd-font 아이콘이 정상 동작하도록 하기
- [ ] 자바 개발 관련 플러그인과 설정 방법 문서화 하기

---

## 참고한 유튜브 영상

- [드림코딩](https://www.youtube.com/watch?v=cY0JxzENBJg&t=39s&pp=ygUNdmltIOyCrOyaqeuylQ%3D%3D) - Vim-motion 사용법
- [Josean Martinez](https://www.youtube.com/watch?v=6pAG3BHurdM&pp=ygULam9zZWFuIG52aW0%3D) - 현재 리포의 베이스가 된 영상
- [TJ DeVries](https://www.youtube.com/watch?v=m8C0Cq9Uv9o&pp=ygUHdGogbnZpbQ%3D%3D) - KickStart.nvim 설명

## 설치 전 작업

### 니오빔 설치

- 해당 Distro의 패키지 매니저로 `nvim`을 설치한다
  - Kali: `sudo apt install nvim`

### Source로 부터 Build

- 패키지 매니저로 설치 했을때 최신 버젼이 아닐 수 있음

<details>
    <summary>확장하기</summary>

#### 설치

- 의존 프로그램 설치

```sh
sudo apt update
sudo apt install ninja-build gettext cmake unzip curl build-essential git
```

- 소스 코드를 클론할 경로 생성

```sh
mkdir Repository && cd Repository
```

- Neovim 리포 클론

```sh
git clone https://github.com/neovim/neovim.git
cd neovim
```

- 안정적인 버젼 체크아웃

```sh
git checkout stable
```

- Build: `Ninja`를 이용해서 빌드한다

```sh
make CMAKE_BUILD_TYPE=RelWithDebInfo
```

- 그리고 설치

```sh
sudo make install
```

- 정상적으로 설치 됬는지 버젼을 확인

```sh
nvim -v
```

</details>

---

### 필요한 의존 프로그램

- `git`: github에서 clone 할 때 필요
- `nerd fonts`: 아이콘
- `fzf`: Telescope 기능에 필요
- `ripgrep`: Telescope live_grep 기능에 필요
- `node.js`: LSP 설치
- `pnpm`: live-server 설치
- `yarn`: markdown-preview 설치
- `lazygit`: git TUI(Terminal User Interface) tool

---

#### Dependencies 설치

- `Kali` 리눅스

```sh
sudo apt install git ripgrep fzf
```

- nodejs, npm 설치

```sh
sudo apt install nodejs npm
```

- pnpm, yarn, tree-sitter-cli 설치

```sh
sudo npm install -g pnpm yarn
```

- `pnpm`을 사용할 수 있도록 설정

```sh
pnpm setup
```

- `pnpm` 설정이 `~/.bashrc` 또는 `~/.zshrc`에 적용되었고 새로 고침을 해준다

```sh
source ~/.zshrc
```

- LazyGit 설치

  - [jesseduffield/lazygit](https://github.com/jesseduffield/lazygit)

```sh
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
```

- 설치 확인

```sh
lazygit -v
```

---

### 리포지토리 클론

- 설정의 기본 경로는 `~/.config/nvim`에 있다

```sh
cd ~/.config
```

- 이미 있는 설정 파일을 `mv(move)`로 이름 변경하여 백업

```sh
mv nvim nvim.bak
```

- 이미 있는 플러그인, 캐시 삭제

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

- 이 리포를 클론 하고서 따로 관리하고 싶다면 `nvim` 경로 밑에 있는 `.git/` 폴더를 삭제하면 된다
- Neovim 플러그인들의 버젼을 git을 이용해서 관리하고 싶다면(플러그인들도 가끔 고장
  나기 때문에) `.gitignore` 안에 있는 `**/lazy-lock.json` 파일을 삭제하면 된다

---

### 현재 리포를 기본 설정과 같이 쓰기

- ex) 클론을 `~/.config/unemotioned` 경로에 했다면 다음 명령어를 사용해서 다른 설정의 `nvim` 사용 가능

```sh
NVIM_APPNAME=unemotioned nvim
```

- `~/.bashrc` 또는 `~/.zshrc`에 별칭을 추가해서 사용할 수도 있다

```sh
alias evim="NVIM_APPNAME=unemotioned nvim"
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

- `ftplugin`: 특정 파일 확장자에만 적용되는 설정 지정
- `core`: 옵션, 키맵
- `plugins`: 모든 플러그인
- `lsp`: lsp-config, mason

---

## 나의 Neovim 설명

### Options

---

### Keymaps

- 기본 키맵 재설정 그리고 lsp-config.nvim, gitsigns.nvim 키맵을 제외한
  플러그인들의 키맵이 들어 있음

- `:Telescope keymaps` 명령어를 이용해서 키맵들을 검색할 수 있음

- `:WhichKey` 명령어를 이용해서 현재 사용 가능한 키맵 팝업창을 띄울 수 있음

---

### LSP (Language Server Protocol)

#### LSP 란?

- 에디터를 `Language Server`와 연결해 줘서 자동완성, syntax-highlighting, 에러 파악
  등의 기능을 제공한다

---

- Lua

  - lua_ls
  - stylua

- HTML, CSS, JavaScript

  - html
  - cssls
  - ts_ls
  - emmet_ls
  - prettier
  - eslint_d

- C, C++

  - clangd
  - cpplint
  - clang-format

- Python

  - ruff

- Markdown

  - marksman
  - markdownlint

- Toml

  - taplo

- 철자

  - typos_lsp

---

### Plugins

#### Lazy 플러그인 매니저

- [alpha](#alpha)
- [auto-session](#auto-session)
- [bigfile](#bigfile)
- [comment](#comment)
- [conform](#conform)
- [dressing](#dressing)
- [fidget](#fidget)
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
- [trouble](#trouble)
- [undotree](#undotree)
- [vim-maximizer](#vim-maximizer)
- [vim-tmux-navigator](#vim-tmux-navigator)
- [which-key](#which-key)

---

#### alpha

- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)

- `nvim` 명령어로 시작했을 때 커스텀한 화면을 보여줌

- [`patorjk.com`](https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=netblock)에서 `header`에 보여줄 ASCII Art를 바꿀 수 있음

- `button`에서 보여주는 키를 `Alpha` 창에서 입력하면 원래 키맵과 다르게 기능을 실행할 수있다

- `:Alpha` 명령어를 사용해서 현재 창에서 보여줄 수도 있다

#### auto-session

- [rmagatti/auto-session](https://github.com/rmagatti/auto-session)

- 해당 경로의 열려있는 파일, 창 등을 자동으로 저장하고 복원할 수 있다

#### bigfile

- [LunarVim/bigfile.nvim](https://github.com/LunarVim/bigfile.nvim)

- 파일이 특정 크기 이상일 때 일부 기능들을 꺼준다

#### colorscheme

- [Catppuccin](https://github.com/catppuccin/nvim)
- [Gruvbox](https://github.com/ellisonleao/gruvbox.nvim)
- [Rose-pine](https://github.com/rose-pine/neovim)
- [Tokyonight](https://github.com/folke/tokyonight.nvim)

- Neovim 테마 모음

  - 각각의 테마들은 local 변수에 `table`로 선언되어있고 파일 마지막 줄에 `return`의 값을 바꾸고 다실 실행하면 설치가 된다

- 각 테마들은 `flavor`, `variant`, `style`의 값을 변경하여서 다른 버전으로 사용할 수 있다

#### comment

- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

- 향상된 주석 기능

#### conform

- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)

- 향상된 포멧(띄어쓰기, 들여쓰기, 줄 바꾸기) 기능

  - `SAPCE p` : 포멧

#### dressing

- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim)

- 향상된 UI

#### fidget

- [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim)

- 해당 buffer에 LSP 상태를 오른쪽 아래에서 보여줌

#### flash

- [folke/flash.nvim](https://github.com/folke/flash.nvim)

- 향상된 화면 내에서의 커서 이동

  - `SPC SPC f` 누르고서 찾고자 하는 단어 입력하다보면
    단어 옆에 뜨는 알파벳을 누르면 이동된다

#### gitsigns

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

- Buffer에서의 git 상태를 gutter(line-number 옆)에서 보여준다

#### harpoon

- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)

- 향상된 파일 간 이동

  - `ALT + u` : 현재 파일을 harpoon에 저장
  - `ALT + i` : harpoon 팝업창을 띄우고 파일로 이동 또는 리스트 편집 가능
  - `ALT + h` : harpoon 리스트의 첫번째 파일로 이동
  - `ALT + j` : 두번쨰 ...
  - `ALT + k` : ...
  - `ALT + l` : ...

#### lazygit

- [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

- Neovim 화면에서 LazyGit을 불러옴

  - `SPC h g`

#### live-server

- [barrett-ruth/live-server.nvim](https://github.com/barrett-ruth/live-server.nvim)

- `npm` 패키지 `live-server`를 사용해서 html, css, javascript 파일 미리 보기

  - `SAPCE l o` : 시작
  - `SAPCE l c` : 종료
  - `SAPCE l t` : 토글

#### lualine

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

- 상태바
  - vim 의 모드(normal, insert, viaul ...)
  - git 상태 (branch ...)
  - 파일 이름, 상태, 크기, 위치 등

#### markdown-preview

- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

- Markdown 파일 미리보기 기능 제공

  - `SPC m p` : localhost를 사용해서 미리보기를 브라우저에 띄운다

#### marks

- [chentoast/marks.nvim](https://github.com/chentoast/marks.nvim)

- Gutter(line-number 옆)에 마크를 보여줌

#### mini-icon

- [echasnovski/mini.icons](https://github.com/echasnovski/mini.icons)

- Nvim에서 보여줄 아이콘 제공

#### no-neck-pain

- [shortcuts/no-neck-pain.nvim](https://github.com/shortcuts/no-neck-pain.nvim)

- Buffer 중앙 정렬 기능

  - `SPC n p`

#### nvim-autoparis

- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)

- 여는 따옴표, 괄호, HTML 태그 등을 자동으로 닫아줌

#### nvim-cmp

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

- 자동 완성 엔진

#### nvim-colorizer

- [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)

- Virtual-text를 만들어서 색깔을 보여줌

#### nvim-hlslens

- [kevinhwang91/nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)

- Buffer 내에서 검색 결과를 보여줄 때 더 많은 기능을 제공

#### nvim-lint

- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)

- Lint: 코드의 경고, 에러 등을 보여줌

#### nvim-surround

- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)

- 문자 쌍 또는 HTML 태그를 추가/삭제/변경 기능

#### nvim-tree

- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

- Neovim에서 VSCode 같은 파일 탐색기를 제공

  - `SPC e e` : nvimtree 토글
  - `SPC e f` : 현재 파일을 nvimtree에서 연다

#### nvim-treesitter

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

- 향상된 syntax-highlight 기능

#### oil

- [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)

- 파일 시스템을 일반 Neovim buffer 처럼 편집 할 수 있는 기능

  - `underscore(-)`를 눌러서 현재 위치의 부모 경로를 연다

#### plenary

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

- Neovim 플러그인을 개발하는데 필수적인 function들을 제공하는 라이브러리

#### render-markdown

- [render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim)

- 향상된 markdown 파일 보여주는 기능

- `SPC m r` : 파일에 신기한 효과 추가

#### tabout

- [abecodes/tabout.nvim](https://github.com/abecodes/tabout.nvim)

- Tab 키를 이용해서 점, 따옴표, 괄호 등을 뛰어넘을 수 있는 기능 제공

#### telescope

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

- Neovim 내에서 파일, 문자 등을 검색할 수 있는 기능 제공

  - `SPC f f` : 파일 찾기
  - `SPC f w` : CWD에서 문자열 찾기
  - `SPC f s` : CWD에서 심볼 찾기

#### todo-comments

- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

- 주석으로 되어 있는 TODO:, NOTE: 등의 단어들을 강조

  <!-- WARNING: -->
  <!-- BUG: -->

#### trouble

- [folke/trouble.nvim](https://github.com/folke/trouble.nvim)

- 코드 진단, `telescope` 검색 결과 등을 보여주는 리스트

#### undotree

- [mbbill/undotree](https://github.com/mbbill/undotree)

- 뒤로 가기 기록을 나무 형식으로 보여주는 기능

  - `SPC u` : undotree 창을 연다

#### vim-maximizer

- [szw/vim-maximizer](https://github.com/szw/vim-maximizer)

- 창을 분할 했을때 최대화/복구하는 기능 제공

  - `SPC s m` : 초점 맞춰져 있는 창을 최대화/복원

#### vim-tmux-navigator

- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

- TMUX와 Neovim의 window 또는 pane들을 편하게 이동할 수 있는 기능 제공

  - `Ctrl + h, j, k, l` 키를 눌러서 이동

#### which-key

- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

- 팝업창으로 사용 가능한 키맵들을 보여준다

  - `SPC` 키를 한번 누르고 기다려도 된다

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

- [Vimium](https://github.com/philc/vimium): Chrome, FireFox, Edge에서 vim-motion을 이용해서 웹 브라우징
- [Vimari](https://github.com/televator-apps/vimari#vimari-modes): safari에서...

---

#### Happy Ricing 🎉
