
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

threadtypeaddFrame = inherit(GmBase.FrameBase):name("threadtypeaddFrame")

threadtypeaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_threadtypeadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areathreadtypeaddarea
	self.areathreadtypeaddarea = gm_xinbanchunzhongyun.threadtypeaddareaArea(self)
	
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
			self.areanav:set_title('threadtypeadd')
		elseif self.areanav.set then
			self.areanav:set('title','threadtypeadd')
		end
					
		if self.areathreadtypeaddarea.set_title then
			self.areathreadtypeaddarea:set_title('threadtypeadd')
		elseif self.areathreadtypeaddarea.set then
			self.areathreadtypeaddarea:set('title','threadtypeadd')
		end
					
	
	self.mainarea = self.areathreadtypeaddarea
	
	self:set_style('display:none')

	
end


threadtypeaddFrame.set_data_id = function(self,data)
	
	if self.areathreadtypeaddarea.set_data_id then
		self.areathreadtypeaddarea:set_data_id(data)
	end
				
end


threadtypeaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areathreadtypeaddarea.set_data then
		self.areathreadtypeaddarea:set_data(data)
	end
			
end




threadtypeaddFrame.on_show = function(self)
			
	if self.areathreadtypeaddarea.on_show then
		self.areathreadtypeaddarea:on_show()
	end
			
end


threadtypeaddFrame.on_hide = function(self)
			
	if self.areathreadtypeaddarea.on_hide then
		self.areathreadtypeaddarea:on_hide()
	end		
			
end

	


	