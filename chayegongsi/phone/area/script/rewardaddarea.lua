	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_chayegongsi")

rewardaddareaArea = inherit(GmCtrl.ControlBase):name("rewardaddareaArea")

rewardaddareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "rewardaddareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
		-- form.lua.xsl form 87 chayegongsi/classdata/rewardpost.xml
		
		-- form.lua.xsl form 38
	self.sortid = self:get_child('sortid')
	self.sortid:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.cover = self:get_child('cover')
	self.cover:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.subject = self:get_child('subject')
	self.subject:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.message = self:get_child('message')
	self.message:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.tags = self:get_child('tags')
	self.tags:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.fid = self:get_child('fid')
	self.fid:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.invisible = self:get_child('invisible')
	self.invisible:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.anonymous = self:get_child('anonymous')
	self.anonymous:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.usesig = self:get_child('usesig')
	self.usesig:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.allownoticeauthor = self:get_child('allownoticeauthor')
	self.allownoticeauthor:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.wysiwyg = self:get_child('wysiwyg')
	self.wysiwyg:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.special = self:get_child('special')
	self.special:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.addfeed = self:get_child('addfeed')
	self.addfeed:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.uploadalbum = self:get_child('uploadalbum')
	self.uploadalbum:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.adddynamic = self:get_child('adddynamic')
	self.adddynamic:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.mod = self:get_child('mod')
	self.mod:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.action = self:get_child('action')
	self.action:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.rewardprice = self:get_child('rewardprice')
	self.rewardprice:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.fmtuploadtype = self:get_child('fmtuploadtype')
	self.fmtuploadtype:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
			
	self.mgr = gm_chayegongsi.clsrewardmgr.get_instance()
	self.mgr:add_ui('rewardaddareaArea',self)
	
		
	self.public = self:get_child('public')
	self.public:set_click(function(link)			
		-- todo
		top.mgr:run('rewardpost',top)
	end)
		
	self.sorkey = ''
	

	self.page = 0
	
	self:show_scroll_bar(true)

end


	
rewardaddareaArea.callback = function(self,key,tb)
	self.hostWindow:delTopNavFrame()
end




rewardaddareaArea.set_ref_data = function(self,data)
	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


rewardaddareaArea.set_data = function(self,data)
	self.data = data
	
	if self.rewardpost and self.rewardpost.set_data then
		self.rewardpost:set_data(data)
	end			
		
	if self.br and self.br.set_data then
		self.br:set_data(data)
	end
		
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
end


