
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

useraddFrame = inherit(GmBase.FrameBase):name("useraddFrame")

useraddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_useradd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areauseraddarea
	self.areauseraddarea = gm_chayegongsi.useraddareaArea(self)
	
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
			self.areanav:set_title('useradd')
		elseif self.areanav.set then
			self.areanav:set('title','useradd')
		end
					
	
	self.mainarea = self.areauseraddarea
	
	self:set_style('display:none')

	
end


useraddFrame.set_data_id = function(self,data)
	
	if self.areauseraddarea.set_data_id then
		self.areauseraddarea:set_data_id(data)
	end
				
end


useraddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areauseraddarea.set_data then
		self.areauseraddarea:set_data(data)
	end
			
end




useraddFrame.on_show = function(self)
			
	if self.areauseraddarea.on_show then
		self.areauseraddarea:on_show()
	end
			
end


useraddFrame.on_hide = function(self)
			
	if self.areauseraddarea.on_hide then
		self.areauseraddarea:on_hide()
	end		
			
end

	


	