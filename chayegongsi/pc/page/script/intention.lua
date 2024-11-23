
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

intentionFrame = inherit(GmBase.FrameBase):name("intentionFrame")

intentionFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_intention"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaintentionarea
	self.areaintentionarea = gm_chayegongsi.intentionareaArea(self)
	
	if self.areaintentionarea.set then
				
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
			self.areanav:set_title('买卖意向单')
		elseif self.areanav.set then
			self.areanav:set('title','买卖意向单')
		end
					
	
	self.mainarea = self.areaintentionarea
	
	self:set_style('display:none')

	
end


intentionFrame.set_data_id = function(self,data)
	
	if self.areaintentionarea.set_data_id then
		self.areaintentionarea:set_data_id(data)
	end
				
end


intentionFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaintentionarea.set_data then
		self.areaintentionarea:set_data(data)
	end
			
end




intentionFrame.on_show = function(self)
			
	if self.areaintentionarea.on_show then
		self.areaintentionarea:on_show()
	end
			
end


intentionFrame.on_hide = function(self)
			
	if self.areaintentionarea.on_hide then
		self.areaintentionarea:on_hide()
	end		
			
end

	


	