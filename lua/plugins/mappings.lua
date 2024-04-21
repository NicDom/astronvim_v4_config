-- User specific keybindings

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { name = "Buffers" },
          ["<Leader>w"] = { "<cmd>w<cr>", desc = "Save" },
          ["<Leader>Q"] = { "<cmd>qa<cr>", desc = "Quit all" },
          ["<Leader>Dr"] = {
            function()
              local word = vim.fn.expand "<cword>"
              local rp = vim.fn.input "Replace with: "
              vim.cmd("%s/" .. word .. "/" .. rp .. "/g")
            end,
          },
          ["<Leader>fp"] = { "<cmd>Telescope projects<CR>", desc = "Find Projects" },

          -- Neotest
          -- ["<Leader>k"] = { name = "ﭧ Test" },
          -- ["<Leader>kr"] = { "<cmd>lua require('neotest').run.run()<cr>", desc = "Run" },
          -- ["<Leader>kf"] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
          -- ["<Leader>kk"] = { "<cmd>lua require('neotest').run.run( { suite = true } )<cr>", desc = "Suite" },
          -- ["<Leader>ka"] = { ":wa<cr>:TermExec cmd='pytest -s -vv'<cr>", desc = "All" },
          -- ["<Leader>ks"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
          -- ["<Leader>kw"] = { "<cmd>lua require('neotest').watch.watch()<cr>", desc = "Watch" },
          -- ["<Leader>kn"] = {
          --   "<cmd>lua require('neotest').jump.next({ status = 'failed' })<cr>",
          --   desc = "Jump Next Fail",
          -- },
          -- ["<Leader>kp"] = {
          --   "<cmd>lua require('neotest').jump.prev({ status = 'failed' })<cr>",
          --   desc = "Jump Previous Fail",
          -- },
          -- ["<Leader>ko"] = {
          --   "<cmd>lua require('neotest').output.open( {enter = true, short = false} )<cr>",
          --   desc = "Output",
          -- },

          -- Code Runner
          ["<Leader>r"] = { name = " Run" },
          ["<Leader>rr"] = { ":RunCode<CR>", desc = " Run" },
          ["<Leader>rf"] = { ":RunFile float<CR>", desc = " Run File" },
          ["<Leader>rc"] = { ":RunClose<CR>", desc = " Close" },
          ["<Leader>rp"] = { ":RunProject<CR>", desc = " Run Project" },
          ["<Leader>rt"] = { ":RunFile toggleterm<CR>", desc = " Run File Terminal" },

          --Motion
          ["J"] = { "<C-d>", desc = "Scroll Down" },
          ["U"] = { "<C-u>", desc = "Scroll Up" },
          ["<Tab>"] = { ":bnext<cr>", desc = "Next Buffer" },
          ["<S-Tab>"] = { ":bprev<cr>", desc = "Previous Buffer" },
          ["ö"] = { ":wincmd w<cr>", desc = "Go window right" },
          ["M"] = { "/", desc = "Search" },
          -- ["<Leader>s"] = { name = "Split Window"},
          -- ["<Leader>ss"] = {":vsplit<cr>", desc = "Vertically"},
          -- ["<Leader>sh"] = {":split<cr>", desc = "Horizontally"},

          -- quick save
          ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

          -- toggles
          ["<Leader>uP"] = {
            function()
              local status = "online"
              local cp_client_ok, cp_client = pcall(require, "copilot.client")
              if not cp_client_ok then
                status = "offline"
                return
              end
              local client = cp_client.get()
              if not client then
                status = "offline"
                return
              end
              if status == "offline" then
                require("copilot.command").enable()
              else
                require("copilot.command").disable()
              end
            end,
            -- this is some
            desc = "Toggle Copilot",
          },
          ["<Leader>BB"] = { "V~<cmd> lua require('comment-box').albox()<cr>v", desc = "Left aligned box and text" },
        },
        v = {
          ["<Leader>BB"] = { "~<cmd> lua require('comment-box').albox()<cr>v", desc = "Left aligned box and text" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
          ["<esc>"] = { "<C-\\><C-n>", desc = "Exit Insert Mode" },
          ["kj"] = { "<C-\\><C-n>", desc = "Exit Insert Mode" },
          ["jk"] = { "<C-\\><C-n>", desc = "Exit Insert Mode" },
          ["jj"] = { "<C-\\><C-n>", desc = "Exit Insert Mode" },
        },
        x = {
          ["gS"] = { "<Plug>VgSurround", desc = "Visual Add Surround Indent" },
        },
      },
    },
  },
}
