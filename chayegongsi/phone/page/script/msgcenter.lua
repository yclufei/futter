
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

msgcenterFrame = inherit(GmBase.FrameBase):name("msgcenterFrame")

msgcenterFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_msgcenter"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areamsgcenterarea
	self.areamsgcenterarea = gm_chayegongsi.msgcenterareaArea(self)
	
	if self.areamsgcenterarea.set then
				
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
			self.areanav:set_title('消息中心')
		elseif self.areanav.set then
			self.areanav:set('title','消息中心')
		end
					
	
	self.mainarea = self.areamsgcenterarea
	
	self:set_style('display:none')

	
end


msgcenterFrame.set_data_id = function(self,data)
	
	if self.areamsgcenterarea.set_data_id then
		self.areamsgcenterarea:set_data_id(data)
	end
				
end


msgcenterFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areamsgcenterarea.set_data then
		self.areamsgcenterarea:set_data(data)
	end
			
end




msgcenterFrame.on_show = function(self)
			
	if self.areamsgcenterarea.on_show then
		self.areamsgcenterarea:on_show()
	end
			
end


msgcenterFrame.on_hide = function(self)
			
	if self.areamsgcenterarea.on_hide then
		self.areamsgcenterarea:on_hide()
	end		
			
end

	


	