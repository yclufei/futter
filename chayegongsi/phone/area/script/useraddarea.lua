

-- D:\GOA\reslibrary\templete\default\phone\area\clsadd\lua.xsl
gr_module("gm_chayegongsi")

useraddareaArea = inherit(GmCtrl.ControlBase):name("useraddareaArea")

useraddareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "useraddarea"
	GmCtrl.ControlBase.init(self,parent,fid )
	

end

useraddareaArea.set_data = function(self,data)
	print('useraddarea.set_data')
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
end
	
	
	