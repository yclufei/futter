

-- D:\GOA\reslibrary\templete\default\pad\area\privacyarea\lua.xsl privacyarea

gr_module("gm_chayegongsi")

privacyareaArea = inherit(GmCtrl.ControlBase):name("privacyareaArea")

privacyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "privacyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)


		
end



	
	
	
	