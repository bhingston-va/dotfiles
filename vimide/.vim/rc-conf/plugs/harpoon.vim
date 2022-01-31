" Marks
"" you mark files you want to revisit later on
"" also add vim local mark
nnoremap <silent> <leader>hh :lua require("harpoon.mark").add_file()<CR>

" File Navigation
"" view all project marks with:
nnoremap <silent> <leader>hv :lua require("harpoon.ui").toggle_quick_menu()<CR>

"" you also can switch to any mark without bringing up the menu
"" use vim local marks to jump to main spot
nnoremap <silent> <leader>ha :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent> <leader>hs :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent> <leader>hd :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent> <leader>hf :lua require("harpoon.ui").nav_file(4)<CR>
"" you can also cycle the list in both directions
"" use vim local marks to jump to main spot
nnoremap <silent> <leader>hn :lua require("harpoon.ui").nav_next()<CR>
nnoremap <silent> <leader>hN :lua require("harpoon.ui").nav_prev()<CR>
