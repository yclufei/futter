
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

clientypemgrFrame = inherit(GmBase.FrameBase):name("clientypemgrFrame")

clientypemgrFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_clientypemgr"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaclientypemgrarea
	self.areaclientypemgrarea = gm_xinbanchunzhongyun.clientypemgrareaArea(self)
	
	if self.areaclientypemgrarea.set then
				
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
			self.areanav:set_title('客户分类管理')
		elseif self.areanav.set then
			self.areanav:set('title','客户分类管理')
		end
					
		if self.areaclientypemgrarea.set_title then
			self.areaclientypemgrarea:set_title('客户分类管理')
		elseif self.areaclientypemgrarea.set then
			self.areaclientypemgrarea:set('title','客户分类管理')
		end
					
	
	self.mainarea = self.areaclientypemgrarea
	
	self:set_style('display:none')

	
end


clientypemgrFrame.set_data_id = function(self,data)
	
	if self.areaclientypemgrarea.set_data_id then
		self.areaclientypemgrarea:set_data_id(data)
	end
				
end


clientypemgrFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaclientypemgrarea.set_data then
		self.areaclientypemgrarea:set_data(data)
	end
			
end




clientypemgrFrame.on_show = function(self)
			
	if self.areaclientypemgrarea.on_show then
		self.areaclientypemgrarea:on_show()
	end
			
end


clientypemgrFrame.on_hide = function(self)
			
	if self.areaclientypemgrarea.on_hide then
		self.areaclientypemgrarea:on_hide()
	end		
			
end

	


	