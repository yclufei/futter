

-- D:\GOA\reslibrary\templete\default\pc\area\clsadd\lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

forumcommentaddareaArea = inherit(GmCtrl.ControlBase):name("forumcommentaddareaArea")

forumcommentaddareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "forumcommentaddarea"
	GmCtrl.ControlBase.init(self,parent,fid )
	

end

forumcommentaddareaArea.set_data = function(self,data)
	print('forumcommentaddarea.set_data')
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
end
	
	
	