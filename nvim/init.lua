-- load python env accordingly
local conda_env = os.getenv("CONDA_DEFAULT_ENV")

if conda_env then
	local python = "/home/greg/anaconda3/envs/" .. conda_env .. "/bin/python"
	vim.g.python3_host_prog = python
end

-- load files
require("keymaps")
require("options")
require("plugins.lazy")
require("plugins.keymaps")
require("plugins.options")

