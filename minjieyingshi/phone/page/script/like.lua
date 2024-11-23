
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_minjieyingshi")

likeFrame = inherit(GmBase.FrameBase):name("likeFrame")

likeFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_like"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- arealikearea
	self.arealikearea = gm_minjieyingshi.likeareaArea(self)
	
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
			self.areanav:set_title('喜欢')
		elseif self.areanav.set then
			self.areanav:set('title','喜欢')
		end
					
	
	self.mainarea = self.arealikearea
	
	self:set_style('display:none')

	
end


likeFrame.set_data_id = function(self,data)
	
	if self.arealikearea.set_data_id then
		self.arealikearea:set_data_id(data)
	end
				
end


likeFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arealikearea.set_data then
		self.arealikearea:set_data(data)
	end
			
end




likeFrame.on_show = function(self)
			
	if self.arealikearea.on_show then
		self.arealikearea:on_show()
	end
			
end


likeFrame.on_hide = function(self)
			
	if self.arealikearea.on_hide then
		self.arealikearea:on_hide()
	end		
			
end

	


	