
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

mobileFrame = inherit(GmBase.FrameBase):name("mobileFrame")

mobileFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_mobile"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areamobilearea
	self.areamobilearea = gm_xinbanchunzhongyun.mobileareaArea(self)
	
	if self.areamobilearea.set then
				
	end
	
		if self.areamobilearea.set_title then
			self.areamobilearea:set_title('移动终端')
		elseif self.areamobilearea.set then
			self.areamobilearea:set('title','移动终端')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
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

	


	