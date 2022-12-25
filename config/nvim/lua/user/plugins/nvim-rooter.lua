require('nvim-rooter').setup {
  rooter_patterns = { '.git', '.hg', '.svn', '.pom' },
  trigger_patterns = { '*' },
  manual = false,
}
