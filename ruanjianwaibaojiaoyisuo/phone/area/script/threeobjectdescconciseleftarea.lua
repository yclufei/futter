
					
-- D:\GOA\reslibrary\templete\default\phone\area\threeobjectdescconciseleftarea\lua.xsl
	
gr_module("gm_ruanjianwaibaojiaoyisuo")

threeobjectdescconciseleftareaArea = inherit(GmBase.TOLeftArea):name("threeobjectdescconciseleftareaArea")

threeobjectdescconciseleftareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "TO_left_area"
	GmBase.TOLeftArea.init(self,parent,fid )

	

	
	self.func = function(ctrl)
--		table.print(ctrl.data)
	end
	
end

threeobjectdescconciseleftareaArea.on_select = function(self,data)
	if data.id then
		self.hostWindow:exec_action('forumlist:'..tostring(data.id))
	else
		cerror('threeobjectdescconciserightareaArea.on_select error',data.id)
--		table.print(data)
	end
end


	
	
	
	