local fn = vim.fn

vim.api.nvim_exec([[
aug folds
  au!
  au BufNewFile,BufRead Makefile,*.mk,*.sh,*.vimrc,*.vim,*rc,*.conf setl foldlevel=0 foldmethod=marker
aug END

" disable bells
au GUIEnter * set vb t_vb=

aug zsh_theme_ft
  au!
  au BufNewFile,BufRead *.zsh-theme  setlocal filetype=zsh
aug END

aug arduino_ino_ft
  au!
  au BufNewFile,BufRead *.ino  setlocal filetype=cpp
aug END

aug vifm_ft
  au!
  au BufNewFile,BufRead *.vifm,vifm*  setlocal ft=vim
aug END

au BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp,*.cc let b:man_default_sects='2,3'

au BufNewFile,BufRead *.dot,*.dts,*.dtsi,*.make,*.cmake,*.mk,*.j2 setl tw=0

aug clang_ft
  au!
  au BufNewFile,BufRead .clangd,.clang-format,.clang-tidy setl ft=yaml tw=0
aug END

au BufNewFile,BufRead Kbuild setlocal ft=make

au FileType man setl nospell

" replace vim highlighted yank plugin for nvim
au TextYankPost * silent! lua vim.highlight.on_yank{timeout=1000}
]], true)

if fn.executable('xxd') then
  vim.api.nvim_exec([[
  augroup Binary
    au!
    au BufReadPost * if &bin | %!xxd
    au BufReadPost * set ft=xxd nospell | endif
    au BufWritePre * if &bin | %!xxd -r
    au BufWritePre * endif
    au BufWritePost * if &bin | %!xxd
    au BufWritePost * set nomod | endif
  augroup END
  ]], true)
end
