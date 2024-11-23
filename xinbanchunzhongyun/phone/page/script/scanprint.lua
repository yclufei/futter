
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

scanprintFrame = inherit(GmBase.FrameBase):name("scanprintFrame")

scanprintFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_scanprint"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areascanprintarea
	self.areascanprintarea = gm_xinbanchunzhongyun.scanprintareaArea(self)
	
	if self.areascanprintarea.set then
				
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
			self.areanav:set_title('扫描打印')
		elseif self.areanav.set then
			self.areanav:set('title','扫描打印')
		end
					
		if self.areascanprintarea.set_title then
			self.areascanprintarea:set_title('扫描打印')
		elseif self.areascanprintarea.set then
			self.areascanprintarea:set('title','扫描打印')
		end
					
	
	self.mainarea = self.areascanprintarea
	
	self:set_style('display:none')

	
end


scanprintFrame.set_data_id = function(self,data)
	
	if self.areascanprintarea.set_data_id then
		self.areascanprintarea:set_data_id(data)
	end
				
end


scanprintFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areascanprintarea.set_data then
		self.areascanprintarea:set_data(data)
	end
			
end




scanprintFrame.on_show = function(self)
			
	if self.areascanprintarea.on_show then
		self.areascanprintarea:on_show()
	end
			
end


scanprintFrame.on_hide = function(self)
			
	if self.areascanprintarea.on_hide then
		self.areascanprintarea:on_hide()
	end		
			
end

	


	