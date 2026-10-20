require('helm-ls').setup {
  -- Keep the useful filetype, block highlighting, and % navigation without
  -- changing template text presentation through experimental virtual text.
  conceal_templates = { enabled = false },
  indent_hints = { enabled = false },
}

require('ansible').setup()
