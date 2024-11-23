
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

mobileFrame = inherit(GmBase.FrameBase):name("mobileFrame")

mobileFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_mobile"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areamobilearea
	self.areamobilearea = gm_xinbanchunzhongyun.mobileareaArea(self)
	
	if self.areamobilearea.set then
				
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
			self.areanav:set_title('移动终端')
		elseif self.areanav.set then
			self.areanav:set('title','移动终端')
		end
					
		if self.areamobilearea.set_title then
			self.areamobilearea:set_title('移动终端')
		elseif self.areamobilearea.set then
			self.areamobilearea:set('title','移动终端')
		end
					
	
	self.mainarea = self.areamobilearea
	
	self:set_style('display:none')

	
end


mobileFrame.set_data_id = function(self,data)
	
	if self.areamobilearea.set_data_id then
		self.areamobilearea:set_data_id(data)
	end
				
end


mobileFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areamobilearea.set_data then
		self.areamobilearea:set_data(data)
	end
			
end




mobileFrame.on_show = function(self)
			
	if self.areamobilearea.on_show then
		self.areamobilearea:on_show()
	end
			
end


mobileFrame.on_hide = function(self)
			
	if self.areamobilearea.on_hide then
		self.areamobilearea:on_hide()
	end		
			
end

	


	