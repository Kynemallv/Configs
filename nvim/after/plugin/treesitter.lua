require('nvim-treesitter.configs').setup {
  ensure_installed = { 'vim', 'go', 'lua', 'python', 'sql', 'javascript' },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
