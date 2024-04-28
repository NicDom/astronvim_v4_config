local function delete_lines_below_string(pattern)
  local current_buf = vim.api.nvim_get_current_buf()
  local line_number = vim.fn.search(pattern, "n")

  if line_number > 0 then
    vim.api.nvim_buf_set_lines(current_buf, line_number, -1, false, {})
  else
    print "Pattern not found in the file."
  end
end

local function update_summary()
  if vim.fn.expand "%:t" == "index.norg" then
    -- delete old summary (All under '* Index', keep the header)
    delete_lines_below_string "* Index"
    -- local line_number = vim.fn.search("* Index", "nw")
    -- if line_number ~= 0 then vim.cmd(tostring(line_number) .. ",+1d") end
    vim.cmd "Neorg generate-workspace-summary"
  end
end

return {
  "nvim-neorg/neorg",
  version = "^8",
  dependencies = {
    {
      "vhyrro/luarocks.nvim",
      priority = 1000, -- We'd like this plugin to load first out of the rest
      config = true,
    },
    {
      "nvim-lua/plenary.nvim",
      after = "luarocks.nvim",
    },
    {
      "nvim-neorg/neorg-telescope",
      after = "luarocks.nvim",
    },
  },
  event = "VeryLazy",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.integrations.telescope"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.keybinds"] = {
        config = {
          hook = function(keybinds)
            keybinds.map("norg", "n", keybinds.leader .. "mi", ":Neorg inject-metadata<CR>")
            keybinds.map("norg", "n", keybinds.leader .. "ms", update_summary)
          end,
        },
      }, -- Adds default keybindings
      ["core.esupports.metagen"] = {
        config = {
          author = "Niclas D. Gesing",
        },
      },
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      }, -- Enables support for completion plugins
      ["core.journal"] = {}, -- Enables support for the journal module
      ["core.summary"] = {},
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/projects/notes",
          },
          default_workspace = "notes",
          index = "index.norg",
        },
      },
    },
  },
}
