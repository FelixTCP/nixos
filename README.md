# NixOS 


```lua
-- init.lua
require("packer").startup(function()
    use {
        "lukas-reineke/headlines.nvim",
        after = "nvim-treesitter",
        config = function()
            require("headlines").setup()
        end,
    }
end)
```


