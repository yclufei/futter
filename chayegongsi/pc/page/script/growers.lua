
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

growersFrame = inherit(GmBase.FrameBase):name("growersFrame")

growersFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_growers"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areagrowersarea
	self.areagrowersarea = gm_chayegongsi.growersareaArea(self)
	
	if self.areagrowersarea.set then
				
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
			self.areanav:set_title('名片')
		elseif self.areanav.set then
			self.areanav:set('title','名片')
		end
					
	
	self.mainarea = self.areagrowersarea
	
	self:set_style('display:none')

	
end


growersFrame.set_data_id = function(self,data)
	
	if self.areagrowersarea.set_data_id then
		self.areagrowersarea:set_data_id(data)
	end
				
end


growersFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areagrowersarea.set_data then
		self.areagrowersarea:set_data(data)
	end
			
end




growersFrame.on_show = function(self)
			
	if self.areagrowersarea.on_show then
		self.areagrowersarea:on_show()
	end
			
end


growersFrame.on_hide = function(self)
			
	if self.areagrowersarea.on_hide then
		self.areagrowersarea:on_hide()
	end		
			
end

	


	