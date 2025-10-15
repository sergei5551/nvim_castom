 require('dashboard').setup({
    theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        { 
            icon='󰊳 ', 
            desc = 'Update',
            group = '@property',
            action = 'Lazy update',
            key = 'u' 
        },
        {
            icon = ' ',
            icon_hl = '@Label',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
        },
        {
            icon = '󰙅 ',
            icon_hl = '@DiagnosticHint',
            desc = 'Open tree',
            group = 'DiagnosticHint',
            key = 'e',
            action = ':Neotree float'
        },
        {
            icon = ' ',
            icon_hl = '@Number',
            desc = 'Git Braches',
            group = 'Number',
            key = 'b',
            action = ':Telescope git_branches'
        },
      },
    },
  })
