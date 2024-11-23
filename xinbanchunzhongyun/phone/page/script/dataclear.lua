
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

dataclearFrame = inherit(GmBase.FrameBase):name("dataclearFrame")

dataclearFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_dataclear"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areadatacleararea
	self.areadatacleararea = gm_xinbanchunzhongyun.dataclearareaArea(self)
	
	if self.areadatacleararea.set then
				
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
			self.areanav:set_title('数据清除')
		elseif self.areanav.set then
			self.areanav:set('title','数据清除')
		end
					
		if self.areadatacleararea.set_title then
			self.areadatacleararea:set_title('数据清除')
		elseif self.areadatacleararea.set then
			self.areadatacleararea:set('title','数据清除')
		end
					
	
	self.mainarea = self.areadatacleararea
	
	self:set_style('display:none')

	
end


dataclearFrame.set_data_id = function(self,data)
	
	if self.areadatacleararea.set_data_id then
		self.areadatacleararea:set_data_id(data)
	end
				
end


dataclearFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areadatacleararea.set_data then
		self.areadatacleararea:set_data(data)
	end
			
end




dataclearFrame.on_show = function(self)
			
	if self.areadatacleararea.on_show then
		self.areadatacleararea:on_show()
	end
			
end


dataclearFrame.on_hide = function(self)
			
	if self.areadatacleararea.on_hide then
		self.areadatacleararea:on_hide()
	end		
			
end

	


	