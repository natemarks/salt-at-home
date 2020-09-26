" install plugins
source $HOME/.config/nvim/vim-plug/plugins.vim

" configure fzf
source $HOME/.config/nvim/plug-config/fzf.vim

" configure key mappings
source $HOME/.config/nvim/keys/mappings.vim

" which key seems to detecet some of the key mappings
" the mappings set in which key are only triggered from the which key menus
" if i want v  to window split right, I need to put it in keys/mappings.vim
" if i want to go into the which key menu and trigger it from there, it has to
" go into keys/which-key.vim
source $HOME/.config/nvim/keys/which-key.vim