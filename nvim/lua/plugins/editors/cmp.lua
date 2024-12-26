return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local options = require "nvchad.configs.cmp"

    table.insert(options.sources, {
      name = "lazydev",
      group_index = 0,
    })
    -- options.completion.completeopt = { "menu", "menuone", "noselect" }

    local compare = require "cmp.config.compare"
    options.sorting = {
      comparators = {
        compare.offset,
        compare.exact,
        compare.score,

        -- copied from cmp-under, but I don't think I need the plugin for this.
        -- I might add some more of my own.
        function(entry1, entry2)
          local _, entry1_under = entry1.completion_item.label:find "^_+"
          local _, entry2_under = entry2.completion_item.label:find "^_+"
          entry1_under = entry1_under or 0
          entry2_under = entry2_under or 0
          if entry1_under > entry2_under then
            return false
          elseif entry1_under < entry2_under then
            return true
          end
        end,

        compare.kind,
        compare.sort_text,
        compare.length,
        compare.order,
      },
    }

    return options
  end,
}
