

-- D:\GOA\reslibrary\templete\default\pc\area\clsadd\lua.xsl
gr_module("gm_xinbanchunzhongyun")

threadtypeaddareaArea = inherit(GmCtrl.ControlBase):name("threadtypeaddareaArea")

threadtypeaddareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "threadtypeaddarea"
	GmCtrl.ControlBase.init(self,parent,fid )
	

end

threadtypeaddareaArea.set_data = function(self,data)
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
end
	
	
	