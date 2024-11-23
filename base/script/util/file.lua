

function length_of_file(filename)
	local fh = assert(io.open(filename, "rb"))
	local len = assert(fh:seek("end"))
	fh:close()
	return len
end

function file_exists(path)
	local file = io.open(path, "rb")
	if file then 
		file:close() 
	end
	return file ~= nil
end


