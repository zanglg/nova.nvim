# NOVA
Another VIM color theme, but only supports true color for neovim / vim.

## Limited
### Terminal
WARNING: This color scheme only supports true color.
Check if your terminal supports true color here: [terminal](https://gist.github.com/XVilka/8346728)
### Tmux
* Tmux version must >= v2.2
* set your $TERM to "xterm-256color"
* add this line to your .tmux.conf:
    ```tmux
    set-option -ga terminal-overrides ",xterm-256color:Tc"
    ```

## Installation
### Manual install
`git clone https://github.com/zanglg/nova.vim`
for NeoVIM:
`mv nova.vim/colors/nova.vim ~/.config/nvim/colors/`
for VIM:
`mv nova.vim/colors/nova.vim ~/.vim/colors/`

### Plugin manager:
[vim-plug](https://github.com/junegunn/vim-plug)
```vim
Plug 'zanglg/nova.vim'
```
[Vundle](https://github.com/VundleVim/Vundle.vim)
```vim
Plugin 'zanglg/nova.vim'
```

Then, update your plugin and put this in your init.vim or .vimrc
```vim
set termguicolors
colorscheme nova
```
light version:
```
set background=light
```
dark version:
```
set background=dark
```

## Support Languages and plugins
I have only tested for C/C++.
But I add all the standard highlight groups. I think it will work well for other languages.
If you want to add more highlight group, please feel kind to submit a pull request.

### Language
* C/C++

### Plugin
* NONE

## ScreenShot
### C/C++
![light_cpp](/screenshots/light_cpp.jpeg?raw=true)
![dark_cpp](/screenshots/dark_cpp.jpeg?raw=true)
