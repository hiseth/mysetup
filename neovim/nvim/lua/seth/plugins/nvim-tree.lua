local status, ntree= pcall(require, "nvim-tree")
if not status then
  return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

ntree.setup({
  sort_by = "case_sensitive",
  view = {
     -- width = 30,
     adaptive_size = true,
     mappings = {
       list = {
         { key = "u", action = "dir_up" },
         { key = "v", action = "vsplit" },
         { key = "s", action = "split" }
       }
     }
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

