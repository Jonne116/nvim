local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    sorting_strategy = "ascending",
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-c>'] = actions.close,
        ['<C-d>'] = actions.delete_buffer,
      },
      n = {
        ['<C-c>'] = actions.close,
        ['<C-d>'] = actions.delete_buffer,
      },
    },
    layout_config = {
      horizontal ={
        height = 47,
        prompt_position = "top",
      }
    }
  },
  extensions ={
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
})

require("telescope").load_extension("fzf")
