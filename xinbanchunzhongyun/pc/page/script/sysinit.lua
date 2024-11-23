
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

sysinitFrame = inherit(GmBase.FrameBase):name("sysinitFrame")

sysinitFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_sysinit"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areasysinitarea
	self.areasysinitarea = gm_xinbanchunzhongyun.sysinitareaArea(self)
	
	if self.areasysinitarea.set then
				
	end
	
		if self.areasysinitarea.set_title then
			self.areasysinitarea:set_title('初始化')
		elseif self.areasysinitarea.set then
			self.areasysinitarea:set('title','初始化')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areasysinitarea
	
	self:set_style('display:none')

	
end


sysinitFrame.set_data_id = function(self,data)
	
	if self.areasysinitarea.set_data_id then
		self.areasysinitarea:set_data_id(data)
	end
				
end


sysinitFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areasysinitarea.set_data then
		self.areasysinitarea:set_data(data)
	end
			
end




sysinitFrame.on_show = function(self)
			
	if self.areasysinitarea.on_show then
		self.areasysinitarea:on_show()
	end
			
end


sysinitFrame.on_hide = function(self)
			
	if self.areasysinitarea.on_hide then
		self.areasysinitarea:on_hide()
	end		
			
end

	


	