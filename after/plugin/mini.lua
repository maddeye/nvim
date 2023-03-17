require('mini.move').setup({
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = '<S-h>',
    right = '<S-l>',
    down = '<S-j>',
    up = '<S-k>',
    -- Move current line in Normal mode
    line_left = '<S-h>',
    line_right = '<S-l>',
    line_down = '<S-j>',
    line_up = '<S-k>',
  },
})
