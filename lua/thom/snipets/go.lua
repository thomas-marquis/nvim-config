local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local utils = require("thom.snipets.utils")

local extract_go_test_name = function(_, _, case)
	local filename = vim.fn.expand("%:p:t")
	local value = string.match(filename, "^([a-zA-Z0-9]+)[_.]")

	if not case then
		return value
	end

	if case then
		if case == "upper" then
			return string.upper(value)
		elseif case == "lower" then
			return string.lower(value)
		elseif case == "camel" then
			return string.gsub(value, "^%l", string.upper)
		end
	end
	return value
end

return {
	s(
		"gotestsuite",
		fmt(
			[[
        package {}

        import (
            "testing"

            "github.com/stretchr/testify/assert"
            "github.com/stretchr/testify/suite"
        )

        type {}Suite struct {{
            suite.Suite
        }}

        func Test{}Suite(t *testing.T) {{
            suite.Run(t, new({}Suite))
        }}

        {}
        ]],
			{
				f(utils.get_dir_name),
				f(extract_go_test_name, {}, { user_args = { "camel" } }),
				f(extract_go_test_name, {}, { user_args = { "camel" } }),
				f(extract_go_test_name, {}, { user_args = { "camel" } }),
				i(0),
			}
		)
	),
	s(
		"gotestsuitecase",
		fmt(
			[[
            func (s *{}Suite) Test_{}_Should{}() {{
                // Given
                {}

                // When

                // Then
                assert.Equal(s.T(), "TODO", "TODO")
            }}
            ]],
			{
				f(extract_go_test_name, {}, { user_args = { "camel" } }),
				i(1, "SomeMethod"),
				i(2, "DoTheRightThings"),
				i(0),
			}
		)
	),
}
