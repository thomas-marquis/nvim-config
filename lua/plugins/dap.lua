--- @param input string
--- @param max_length number
local truncate_string = function(input, max_length)
    if #input > max_length then
        return string.sub(input, 1, max_length) .. "..."
    else
        return input
    end
end

return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            ensure_installed = {
                "debugpy",
            },
        },
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "jay-babu/mason-nvim-dap.nvim",
        },
        opts = function(_, opts)
            --- A callback that determines how a variable is displayed or whether it should be omitted
            --- @param variable any https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
            --- @param buf number
            --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
            --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
            --- @param options any Current options for nvim-dap-virtual-text
            --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
            opts.display_callback = function(variable, buf, stackframe, node, options)
                local variable_text = variable.value:gsub("%s+", " ")
                if options.virt_text_pos == "inline" then
                    return " = " .. truncate_string(variable_text, 20)
                else
                    return variable.name .. " = " .. truncate_string(variable_text, 20)
                end
            end
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        opts = {
            max_value_lines = 1,
        },
    },
}
