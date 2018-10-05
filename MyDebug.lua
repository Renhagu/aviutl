local function lprint(...)
	local str = ""
	for i = 1, select("#", ...) do
		local c = select(i, ...)
		if c == "" then c = "#" end
		if i == 1 then
			str = c
		else
			str = str .. " " .. c
		end
	end
	debug_print(str)
	return str
end

local function ltype(...)
	local str = ""
	for i = 1, select("#", ...) do
		if i == 1 then
			str = type(select(i, ...))
		else
			str = str .. " " .. type(select(i, ...))
		end
	end
	debug_print(str)
	return str
end

local function printc(t)
	local s
	if type(t) == "table" then
		s = "{ "
		for i, v in ipairs(t) do
			s = s .. printc(i) .. ": " .. printc(v) .. ", "
		end
		for i, v in pairs(t) do
			s = s .. printc(i) .. " = " .. printc(v) .. ", "
		end
		s = s .. "} "
	elseif type(t) == "string" then
		s = "\"" .. t .. "\""
	elseif type(tostring(t)) == "string" then
		s = tostring(t)
	else
		s = type(t)
	end
	return s
end

local function conf(...)
	local str = ""
	for i = 1, select("#", ...) do
		str = str .. ", " .. printc(select(i, ...))
	end
	debug_print(str)
	return str
end

local function l_G(mode)
	for i, v in pairs(_G) do
		debug_print(printc(i) .. " = " .. printc(v))
	end
end

return {
	print	= lprint,
	type	= ltype,
	conf	= conf,
	_G		= l_G,
}