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

- [다른 nvim config 또는 distro]()
- [다른 eidtor 또는 IDE에서 vim-motion 사용하기]()

## 참고한 유튜브 영상

- [드림코딩](https://www.youtube.com/watch?v=cY0JxzENBJg&t=39s&pp=ygUNdmltIOyCrOyaqeuylQ%3D%3D)
- [Josean Martinez](https://www.youtube.com/watch?v=6pAG3BHurdM&pp=ygULam9zZWFuIG52aW0%3D)
- [TJ DeVries](https://www.youtube.com/watch?v=m8C0Cq9Uv9o&pp=ygUHdGogbnZpbQ%3D%3D)

## 설치전 작업

### 니오빔 설치

- 해당 Distro의 페키지 매니저로 `nvim`을 설치한다
  - Kali: `sudo apt install nvim`
  - Arch: `sudo pacman -S nvim`

---

### 필요한 의존 프로그램

- git
- nerd-fonts
- fzf
- lazygit
- node.js
- pnpm
- yarn
- cargo
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

```sh
sudo apt install git fzf lazygit nodejs npm pnpm yarn
```

- `Arch` 리눅스

```sh
sudo pacman -S git ttf-meslo-nerd fzf lazygit nodejs npm pnpm yarn
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

<details>
    <summary>플러그인 설명 보기</summary>
    <p>

#### alpha

- [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)

- `nvim` 명령어로 시작했을때 커스텀한 화면을 보여줌

- 다음 사이트에서 `header` 에서 보여줄 ASCII 아트를 바꿀 수 있음

  - [patorjk](https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=netblock)

- `button`에서 보여주는 키를 입력하면 원래 키맵과 다르게 명령어를 실행 할 수 있다

- `:Alpha` 명령어를 사용해서 현재 창에서 보여줄 수도 있다

#### auto-session

- [rmagatti/auto-session](https://github.com/rmagatti/auto-session)

#### bigfile

- [LunarVim/bigfile.nvim](https://github.com/LunarVim/bigfile.nvim)

#### comment

- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

#### conform

- [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

#### dressing

- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim)

#### flash

- [folke/flash.nvim](https://github.com/folke/flash.nvim)

#### gitsigns

- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

#### harpoon

- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)

#### lazygit

- [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

#### live-server

- [barrett-ruth/live-server.nvim](https://github.com/barrett-ruth/live-server.nvim)

#### lualine

- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

#### markdown-preview

- [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

#### marks

- [chentoast/marks.nvim](https://github.com/chentoast/marks.nvim)

#### mini-icon

- [echasnovski/mini.icons](https://github.com/echasnovski/mini.icons)

#### no-neck-pain

- [shortcuts/no-neck-pain.nvim](https://github.com/shortcuts/no-neck-pain.nvim)

#### nvim-autoparis

- [windwp/nvim-autopairs](https://github.com/windwp/nvim-autopairs)

#### nvim-cmp

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

#### nvim-colorizer

- [norcalli/nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)

#### nvim-hlslens

- [kevinhwang91/nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)

#### nvim-lint

- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)

#### nvim-surround

- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)

#### nvim-tree

- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

#### nvim-treesitter

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

#### oil

- [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)

#### plenary

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim)

#### tabout

- [abecodes/tabout.nvim](https://github.com/abecodes/tabout.nvim)

#### telescope

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

#### todo-comments

- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

#### tokyonight

- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

#### trouble

- [folke/trouble.nvim](https://github.com/folke/trouble.nvim)

#### undotree

- [mbbill/undotree](https://github.com/mbbill/undotree)

#### vim-maximizer

- [szw/vim-maximizer](https://github.com/szw/vim-maximizer)

#### vim-tmux-navigator

- [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

#### which-key

- [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

</p>
</details>

---

### 다른 nvim config 또는 distro

- [kickstart](https://github.com/nvim-lua/kickstart.nvim)
- [AstroNvim](https://astronvim.com/)
- [LazyVim](https://www.lazyvim.org/)
- [NvChad](https://nvchad.com/)

---

### 다른 eidtor 또는 IDE에서 vim-motion 사용하기

- visual studio:
- visual studio code: `Vim` 또는 `VSCode Neovim`
- eclipse: `Vrapper`, `ScrollOffset`, `Relative Line Number Ruler`
- jetbrains IDE: `IdeaVim`

---

##### Happy Ricing 🎉
