local function apply_case(value, case)
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
	get_file_name = function(_, _, case)
		local filename = vim.fn.expand("%:p:t")
		local value = string.match(filename, "^([a-zA-Z0-1-_]+)[.]")

		return apply_case(value, case)
	end,

	get_dir_name = function(_, _, case)
		local full_path = vim.fn.expand("%:p:h")
		local dirname = string.match(full_path, ".*/(%w+)$")
		return apply_case(dirname, case)
	end,
}
