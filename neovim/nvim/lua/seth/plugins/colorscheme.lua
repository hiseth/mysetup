local status, tn = pcall(require, "tokyonight")
if not status then
  return
end



tn.setup {
  -- ... your barbecue config
  style = "storm",
  dim_inactive = true
  -- ... your barbecue config
}


vim.cmd[[colorscheme tokyonight-storm]]
