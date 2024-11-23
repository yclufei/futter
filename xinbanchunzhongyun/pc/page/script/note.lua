
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

noteFrame = inherit(GmBase.FrameBase):name("noteFrame")

noteFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_note"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanotearea
	self.areanotearea = gm_xinbanchunzhongyun.noteareaArea(self)
	
	if self.areanotearea.set then
				
	end
	
		if self.areanotearea.set_title then
			self.areanotearea:set_title('记事本')
		elseif self.areanotearea.set then
			self.areanotearea:set('title','记事本')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areanotearea
	
	self:set_style('display:none')

	
end


noteFrame.set_data_id = function(self,data)
	
	if self.areanotearea.set_data_id then
		self.areanotearea:set_data_id(data)
	end
				
end


noteFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanotearea.set_data then
		self.areanotearea:set_data(data)
	end
			
end




noteFrame.on_show = function(self)
			
	if self.areanotearea.on_show then
		self.areanotearea:on_show()
	end
			
end


noteFrame.on_hide = function(self)
			
	if self.areanotearea.on_hide then
		self.areanotearea:on_hide()
	end		
			
end

	


	