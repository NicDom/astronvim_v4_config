-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
local Config = require "flash.config"
local Char = require "flash.plugins.char"
for _, motion in ipairs { "f", "t", "F", "T" } do
  vim.keymap.set(
    { "n", "x", "o" },
    motion,
    function()
      require("flash").jump(Config.get({
        mode = "char",
        search = {
          mode = Char.mode(motion),
          max_length = 1,
        },
      }, Char.motions[motion]))
    end
  )
end
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Auto select virtualenv Nvim open",
  pattern = "*",
  callback = function()
    local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
    if venv ~= "" then require("venv-selector").retrieve_from_cache() end
  end,
  once = true,
})
