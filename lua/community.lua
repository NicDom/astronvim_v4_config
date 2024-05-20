-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.comment.mini-comment" },
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.before-nvim" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.editing-support.true-zen-nvim" },
  { import = "astrocommunity.editing-support.wildfire-nvim" },
  -- { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  -- { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.fugit2-nvim" },
  { import = "astrocommunity.git.nvim-tinygit" },
  -- { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.project.project-nvim" },
  -- { import = "astrocommunity.code-runner.sniprun"},
  -- { import = "astrocommunity.indent.indent-tools-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  -- { import = "astrocommunity.split-and-window.edgy-nvim" },
  -- { import = "astrocommunity.split-and-window.windows-nvim" },
  -- { import = "astrocommunity.programming-language-support.rest-nvim" },

  --
  -- Exra Settings
  --

  -- Allow f,F,t,T to be used with labels

  {
    "folke/flash.nvim",
    config = function()
      require("flash").setup {
        modes = {
          char = {
            enabled = false,
          },
        },
      }
    end,
  },

  --S in visual mode to surround collides with flash
  {
    "kylechui/nvim-surround",
    opts = {
      keymaps = {
        visual = "m",
      },
    },
  },
  -- install ruff-lsp when installing venv-selector
  {
    "linux-cultist/venv-selector.nvim",
    build = "pip install --user -U ruff-lsp",
  },
  -- enable copilot for markdown
  {
    "zbirenbaum/copilot-cmp",
    opts = {
      filetypes = { "markdown = true" },
    },
  },
  -- {
  -- "jay-babu/mason-nvim-dap.nvim",
  -- opts = function(_, opts)
  -- opts.ensure_installed =
  -- utils.list_insert_unique(opts.ensure_installed, { "isort", "black", "pylint", "pydocstyle", "pyupgrade" })
  -- end,
  -- },
}
