
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

canceledFrame = inherit(GmBase.FrameBase):name("canceledFrame")

canceledFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_canceled"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areacanceledarea
	self.areacanceledarea = gm_chayegongsi.canceledareaArea(self)
	
	if self.areacanceledarea.set then
				
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
			self.areanav:set_title('已取消')
		elseif self.areanav.set then
			self.areanav:set('title','已取消')
		end
					
	
	self.mainarea = self.areacanceledarea
	
	self:set_style('display:none')

	
end


canceledFrame.set_data_id = function(self,data)
	
	if self.areacanceledarea.set_data_id then
		self.areacanceledarea:set_data_id(data)
	end
				
end


canceledFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areacanceledarea.set_data then
		self.areacanceledarea:set_data(data)
	end
			
end




canceledFrame.on_show = function(self)
			
	if self.areacanceledarea.on_show then
		self.areacanceledarea:on_show()
	end
			
end


canceledFrame.on_hide = function(self)
			
	if self.areacanceledarea.on_hide then
		self.areacanceledarea:on_hide()
	end		
			
end

	


	