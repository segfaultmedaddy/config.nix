local M = {}

-- Assigns all of the key-value pairs from all of the tables in the list to the first table.
-- If a key is already present in the first table, the value from the table being assigned
-- will be appended to the first table's value.
M.assign = function(target, tables)
	for _, t in ipairs(tables) do
		for k, v in pairs(t) do
			if M.is_array(target[k]) and M.is_array(v) then
				M.concat_arrays(target[k], v)
			else
				target[k] = v
			end
		end
	end

	return target
end

M.concat_arrays = function(t1, t2)
	for _, v in ipairs(t2) do
		t1[#t1 + 1] = v
	end
end

M.is_array = function(t)
	if type(t) ~= "table" then
		return false
	end

	local i = 0
	for _ in pairs(t) do
		i = i + 1
		if t[i] == nil then
			return false
		end
	end

	return true
end

return M
