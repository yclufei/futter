	

-- D:\GOA\reslibrary\templete\res\area\area.pad.lua.xsl
					
gr_module("gm_xinbanchunzhongyun")

threadtypemodifyareaArea = inherit(GmCtrl.ControlBase):name("threadtypemodifyareaArea")

threadtypemodifyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "threadtypemodifyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	
	
	
		-- form.lua.xsl form 87 xinbanchunzhongyun/classdata/threadtypepost.xml
		
		-- form.lua.xsl form 38
	self.typeid = self:get_child('typeid')
	self.typeid:set_mousedown(function(ctrl)
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
	self.icon = self:get_child('icon')
	self.icon:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.description = self:get_child('description')
	self.description:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
	
		-- form.lua.xsl form 38
	self.name = self:get_child('name')
	self.name:set_mousedown(function(ctrl)
		local a,b,c,d = ctrl:get_scroll_pos()
		ctrl.parent:set_scroll_pos(0,b)
		print('set_mousedown',a,b,c,d)
	end)
		
	
	
		
	
	self.sorkey = ''

	self.page = 0
	
	self:show_scroll_bar(true)
		

	
	

end


threadtypemodifyareaArea.callback = function(self,key,tb)
	local attrs = self.mgr:GetAttrs()
  if tb.act == 'prev' and table.eq(attrs,tb) then		
		self.mgr:SetPageDirty(true)
		self:clean()
		self:init_item_data()
		self.toploading:set_loading(false)
		self:updatetick(true)
		return true
	else
		print('threadtypemodifyareaArea callback error ',key,tb)
	end
end



threadtypemodifyareaArea.set_data = function(self,data)
	self.data = data
	
	if self.threadtypepost and self.threadtypepost.set_data then
		self.threadtypepost:set_data(data)
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


