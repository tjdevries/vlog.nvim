-- For more information, see `log.lua` and the README for this repo.
-- TODO: Add doc/vlog.txt
local info = debug.getinfo(1, 'S')

local os_sep
if vim.api.nvim_call_function('has', {'win32'}) == 1 then
  os_sep = "\\"
else
  os_sep = "/"
end

local source = string.sub(info.source, 2)
local file_name = vim.api.nvim_call_function('fnamemodify', {source, ':h:h:p'}) .. os_sep .. 'log.lua'

local log = loadfile(file_name)()

return log
