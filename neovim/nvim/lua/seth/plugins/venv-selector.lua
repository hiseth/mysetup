local venv_status, venv_config = pcall(require, "venv-selector")
if not venv_status then
	return
end
venv_config.setup({
	name = { "venv", ".venv", ".python-version" },
	pyenv_path = "/Users/xianfei/.pyenv/versions/",
	auto_refresh = true,
})
