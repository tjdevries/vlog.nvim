# vlog.nvim

### _A logger for neovim_

Single file, no dependency, easy copy &amp; paste log file to add to your neovim lua plugins.


# Usage

```lua
-- Provides both `print` style and `string.format` style logging
log.info("I can pass", my_arg, "like I can for `print`")
log.fmt_info("I can pass %s arguments like `string.format`", my_arg)

-- Provides 
log.trace(...)
log.debug(...)
log.info(...)
log.warn(...)
log.error(...)
log.fatal(...)

-- and the corresponding
log.fmt_trace(...)
log.fmt_debug(...)
log.fmt_info(...)
log.fmt_warn(...)
log.fmt_error(...)
log.fmt_fatal(...)
```

# Configuration

The following values are configurable:

```lua
local default_config = {
  -- Name of the plugin. Prepended to log messages
  plugin = 'vlog.nvim',

  -- Should print the output to neovim while running
  use_console = true,

  -- Should highlighting be used in console (using echohl)
  highlights = true,

  -- Should write to a file
  use_file = true,

  -- Any messages above this level will be logged.
  level = "trace",

  -- Level configuration
  modes = {
    { name = "trace", hl = "Comment", },
    { name = "debug", hl = "Comment", },
    { name = "info",  hl = "None", },
    { name = "warn",  hl = "WarningMsg", },
    { name = "error", hl = "ErrorMsg", },
    { name = "fatal", hl = "ErrorMsg", },
  },

  -- Can limit the number of decimals displayed for floats
  float_precision = 0.01,
}
```


# Installation

There are two ways to install.

## Standalone

The first is simply copying the zero-dependency `log.lua` file into your project. It is recommended that you place this file within a subdirectory of your lua project. After pasting into your project, change the values in the `config` table at the top of the file.

For example, for `my_cool_plugin`, you should place `log.lua` in `my_cool_plugin/log.lua` and require it with `require('my_cool_plugin.log')`.

```lua
local log = require('my_cool_plugin.log')

log.info("Doing some logging")
```

## Neovim Plugin

You can also install this as a plugin (to get any updates) by using your favorite neovim plugin manager.

After doing so, you can use `log.new` to generate a new logger for your plugin.

```lua
-- In my_plugin/log.lua
return require('vlog').new {
    plugin = 'my_cool_plugin',
}

-- In my_plug/other_file.lua
local log = require('my_plugin.log')

log.info("Doing some logging stuff")
```
