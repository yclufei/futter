

-- D:\GOA\reslibrary\templete\default\pc\area\privacyarea\lua.xsl privacyarea

gr_module("gm_ruanjianwaibaojiaoyisuo")

privacyareaArea = inherit(GmCtrl.ControlBase):name("privacyareaArea")

privacyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "privacyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)


		
	self:on_hide()


	self.is_init_data = false
	
end


privacyareaArea.on_show = function(self,key)
	self.scrollcontainer:set_visible(true)
end


privacyareaArea.on_hide = function(self,key)
	self.scrollcontainer:set_visible(false)
end




	
	
	
	