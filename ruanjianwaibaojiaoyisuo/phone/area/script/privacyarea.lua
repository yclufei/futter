

-- D:\GOA\reslibrary\templete\default\phone\area\privacyarea\lua.xsl privacyarea

gr_module("gm_ruanjianwaibaojiaoyisuo")

privacyareaArea = inherit(GmCtrl.ControlBase):name("privacyareaArea")

privacyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "privacyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)

	self.scrollcontent = self.scrollcontainer:get_child("scrollcontent")
		
	self:on_hide()


	self.is_init_data = false
	
end


privacyareaArea.on_show = function(self,key)
	print('privacyareaArea.on_show')
	self.scrollcontent:set_visible(true)
	self.scrollcontainer:set_scroll_pos(0,110*tonumber(gInfo['retina']))
	self:layout()
	self:updatetickMsg()
end


privacyareaArea.on_hide = function(self,key)
	self.scrollcontent:set_visible(false)
end




	
	
	
	