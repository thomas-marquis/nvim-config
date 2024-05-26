local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local ls_extras = require("luasnip.extras")
local r = ls_extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local utils = require("thom.snipets.utils")

return {
	s(
		"#guard_h",
		fmt(
			[[
        #ifndef INCLUDE_{}_{}_H
        #define INCLUDE_{}_{}_H

        {}

        #endif // INCLUDE_{}_{}_H
        ]],
			{
				f(utils.get_dir_name, {}, { user_args = { "upper" } }),
				f(utils.get_file_name, {}, { user_args = { "upper" } }),
				f(utils.get_dir_name, {}, { user_args = { "upper" } }),
				f(utils.get_file_name, {}, { user_args = { "upper" } }),
				i(0),
				f(utils.get_dir_name, {}, { user_args = { "upper" } }),
				f(utils.get_file_name, {}, { user_args = { "upper" } }),
			}
		)
	),
}
