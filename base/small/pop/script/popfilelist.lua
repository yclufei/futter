
gr_module("GmBase")

PopFilelist = inherit(GmCtrl.ControlBase):name("PopFilelist")

PopFilelist.init = function(self,parent)

	local top = self
	GmCtrl.ControlBase.init(self,parent,"popfilelist")
	
	self:set_visible(false)
	


end



PopFilelist.set_dir = function(self,path)
	local d = get_dir(path)
	for a,b in pairs(d) do
		local ctime = os.date("%Y-%m-%d %H:%M:%S", b['ctime'])
		local atime = os.date("%Y-%m-%d %H:%M:%S", b['atime'])
		local mtime = os.date("%Y-%m-%d %H:%M:%S", b['mtime'])
		local f = string.split(a,"/")
		local filename = f[2]
		if filename ~= "." and filename ~= ".." then
			local ff = util.wstring.split(filename,".")
			--table.print(ff)
--			print(b['size'],atime,ctime,mtime)
		end
	end
end

