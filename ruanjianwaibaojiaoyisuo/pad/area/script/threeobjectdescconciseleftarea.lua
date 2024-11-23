
					
-- D:\GOA\reslibrary\templete\default\pad\area\threeobjectdescconciseleftarea\lua.xsl
	
gr_module("gm_ruanjianwaibaojiaoyisuo")

threeobjectdescconciseleftareaArea = inherit(GmBase.threeobjectdescconciseLeftArea):name("threeobjectdescconciseleftareaArea")

threeobjectdescconciseleftareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "threeobjectdescconciseleftareaArea"
	GmBase.threeobjectdescconciseLeftArea.init(self,parent,fid )

	

	
	self.func = function(ctrl)
--		table.print(ctrl.data)
	end
	
end

threeobjectdescconciseleftareaArea.on_select = function(self,data)
	print('threeobjectdescconciseleftareaArea.on_select')
--	table.print(data)
	self.hostWindow:exec_action('forumlist:'..tostring(data.id))
end


	
	
	
	