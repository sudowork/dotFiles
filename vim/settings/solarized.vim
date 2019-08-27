" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
else
  set background=dark
  let g:solarized_termtrans = 1
  colorscheme solarized
endif
