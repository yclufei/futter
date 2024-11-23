
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

clientypeaddFrame = inherit(GmBase.FrameBase):name("clientypeaddFrame")

clientypeaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_clientypeadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaclientypeaddarea
	self.areaclientypeaddarea = gm_xinbanchunzhongyun.clientypeaddareaArea(self)
	
	if self.areaclientypeaddarea.set then
				
	end
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_leftcss then
			self.areanav:set_leftcss('fa-angle-left font45')
		elseif self.areanav.set then
			self.areanav:set('leftcss','fa-angle-left font45')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('添加客户分类')
		elseif self.areanav.set then
			self.areanav:set('title','添加客户分类')
		end
					
		if self.areaclientypeaddarea.set_title then
			self.areaclientypeaddarea:set_title('添加客户分类')
		elseif self.areaclientypeaddarea.set then
			self.areaclientypeaddarea:set('title','添加客户分类')
		end
					
	
	self.mainarea = self.areaclientypeaddarea
	
	self:set_style('display:none')

	
end


clientypeaddFrame.set_data_id = function(self,data)
	
	if self.areaclientypeaddarea.set_data_id then
		self.areaclientypeaddarea:set_data_id(data)
	end
				
end


clientypeaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaclientypeaddarea.set_data then
		self.areaclientypeaddarea:set_data(data)
	end
			
end




clientypeaddFrame.on_show = function(self)
			
	if self.areaclientypeaddarea.on_show then
		self.areaclientypeaddarea:on_show()
	end
			
end


clientypeaddFrame.on_hide = function(self)
			
	if self.areaclientypeaddarea.on_hide then
		self.areaclientypeaddarea:on_hide()
	end		
			
end

	


	