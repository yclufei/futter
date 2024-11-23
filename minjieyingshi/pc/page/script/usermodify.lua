
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_minjieyingshi")

usermodifyFrame = inherit(GmBase.FrameBase):name("usermodifyFrame")

usermodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_usermodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- areausermodifyarea
	self.areausermodifyarea = gm_minjieyingshi.usermodifyareaArea(self)
	
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
			self.areanav:set_title('设置')
		elseif self.areanav.set then
			self.areanav:set('title','设置')
		end
					
		if self.areausermodifyarea.set_title then
			self.areausermodifyarea:set_title('用户')
		elseif self.areausermodifyarea.set then
			self.areausermodifyarea:set('title','用户')
		end
					
	
	self.mainarea = self.areausermodifyarea
	
	self:set_style('display:none')

	
end


usermodifyFrame.set_data_id = function(self,data)
	
	if self.areausermodifyarea.set_data_id then
		self.areausermodifyarea:set_data_id(data)
	end
				
end


usermodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areausermodifyarea.set_data then
		self.areausermodifyarea:set_data(data)
	end
			
end




usermodifyFrame.on_show = function(self)
			
	if self.areausermodifyarea.on_show then
		self.areausermodifyarea:on_show()
	end
			
end


usermodifyFrame.on_hide = function(self)
			
	if self.areausermodifyarea.on_hide then
		self.areausermodifyarea:on_hide()
	end		
			
end

	


	