local module = {  }
module.plugin_install = function(plugs)
    local packer = require("packer")

    packer.startup({
        function()
            local use = packer.use
            for _, plug in pairs(plugs) do
                use(plug)
            end
        end,
        config = {
            display = {
                open_fn = function()
                    return require("packer.util").float({
                        style = "minimal",
                        border = "rounded",
                    })
                end,
            },
            profile = {
                enable = true,
                threshold = 1,
            },
        },
    })
    end

return module
