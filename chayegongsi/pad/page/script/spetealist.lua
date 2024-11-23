
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_chayegongsi")

spetealistFrame = inherit(GmBase.FrameBase):name("spetealistFrame")

spetealistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_spetealist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaspetealistarea
	self.areaspetealistarea = gm_chayegongsi.spetealistareaArea(self)
	
	if self.areaspetealistarea.set then
				
	end
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('特色茶叶')
		elseif self.areanav.set then
			self.areanav:set('title','特色茶叶')
		end
					
	
	self.mainarea = self.areaspetealistarea
	
	self:set_style('display:none')

	
end


spetealistFrame.set_data_id = function(self,data)
	
	if self.areaspetealistarea.set_data_id then
		self.areaspetealistarea:set_data_id(data)
	end
				
end


spetealistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaspetealistarea.set_data then
		self.areaspetealistarea:set_data(data)
	end
			
end




spetealistFrame.on_show = function(self)
			
	if self.areaspetealistarea.on_show then
		self.areaspetealistarea:on_show()
	end
			
end


spetealistFrame.on_hide = function(self)
			
	if self.areaspetealistarea.on_hide then
		self.areaspetealistarea:on_hide()
	end		
			
end

	


	