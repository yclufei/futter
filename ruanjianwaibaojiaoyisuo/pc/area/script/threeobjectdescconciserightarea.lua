
					
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

threeobjectdescconciserightareaArea = inherit(GmBase.threeobjectdescconciseRightArea):name("threeobjectdescconciserightareaArea")

threeobjectdescconciserightareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "threeobjectdescconciserightareaArea"
	GmBase.threeobjectdescconciseRightArea.init(self,parent,fid )

	

	
	self.func = function(ctrl)
--		table.print(ctrl.data)
	end
	
end

threeobjectdescconciserightareaArea.on_select = function(self,data)
	if data.id then
		self.hostWindow:exec_action('forumlist:'..tostring(data.id))
	else
		cerror('threeobjectdescconciserightareaArea.on_select error',data.id)
--		table.print(data)
	end
end


	
	