	

-- D:\GOA\reslibrary\templete\res\area\area.pad.lua.xsl
					
gr_module("gm_minjieyingshi")

videomodifyareaArea = inherit(GmCtrl.ControlBase):name("videomodifyareaArea")

videomodifyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "videomodifyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	
	
	
		-- form.lua.xsl form
		
	self.fid = self:get_child('fid')
	self.fid:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.sortid = self:get_child('sortid')
	self.sortid:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.pic = self:get_child('pic')
	self.picsrc = self:get_child('picsrc')
	self.picsrc:set_click(function(ctrl)
                                                top.hostWindow:open_album(false,function(s,p)
                                                    print(s,p)
                                                    top.picsrc:set_src('ch/'..p)
                                                    top.pic:set_text('ch/'..p)
                                                end)
	end)
	
	
	self.subject = self:get_child('subject')
	self.subject:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.message = self:get_child('message')
	self.message:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.invisible = self:get_child('invisible')
	self.invisible:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.anonymous = self:get_child('anonymous')
	self.anonymous:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.attachment = self:get_child('attachment')
	self.attachment:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.tags = self:get_child('tags')
	self.tags:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.addfeed = self:get_child('addfeed')
	self.addfeed:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.uploadalbum = self:get_child('uploadalbum')
	self.uploadalbum:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.adddynamic = self:get_child('adddynamic')
	self.adddynamic:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.mod = self:get_child('mod')
	self.mod:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.action = self:get_child('action')
	self.action:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
	self.fmtuploadtype = self:get_child('fmtuploadtype')
	self.fmtuploadtype:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
		
	
	
		
	
	self.sorkey = ''

	self.page = 0
	
	self:show_scroll_bar(true)
		

	
	

end


videomodifyareaArea.callback = function(self,key,tb)
	local attrs = self.mgr:GetAttrs()
  if tb.act == 'prev' and table.eq(attrs,tb) then		
		self.mgr:SetPageDirty(true)
		self:clean()
		self:init_item_data()
		self.toploading:set_loading(false)
		self:updatetick(true)
		return true
	else
		print('videomodifyareaArea callback error ',key,tb)
	end
end



videomodifyareaArea.set_data = function(self,data)
	self.data = data
	
	if self.videopost and self.videopost.set_data then
		self.videopost:set_data(data)
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


