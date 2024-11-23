
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

qrsearchsettingFrame = inherit(GmBase.FrameBase):name("qrsearchsettingFrame")

qrsearchsettingFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_qrsearchsetting"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaqrsearchsettingarea
	self.areaqrsearchsettingarea = gm_xinbanchunzhongyun.qrsearchsettingareaArea(self)
	
	if self.areaqrsearchsettingarea.set then
				
	end
	
		if self.areaqrsearchsettingarea.set_title then
			self.areaqrsearchsettingarea:set_title('二维码查单设置')
		elseif self.areaqrsearchsettingarea.set then
			self.areaqrsearchsettingarea:set('title','二维码查单设置')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaqrsearchsettingarea
	
	self:set_style('display:none')

	
end


qrsearchsettingFrame.set_data_id = function(self,data)
	
	if self.areaqrsearchsettingarea.set_data_id then
		self.areaqrsearchsettingarea:set_data_id(data)
	end
				
end


qrsearchsettingFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaqrsearchsettingarea.set_data then
		self.areaqrsearchsettingarea:set_data(data)
	end
			
end




qrsearchsettingFrame.on_show = function(self)
			
	if self.areaqrsearchsettingarea.on_show then
		self.areaqrsearchsettingarea:on_show()
	end
			
end


qrsearchsettingFrame.on_hide = function(self)
			
	if self.areaqrsearchsettingarea.on_hide then
		self.areaqrsearchsettingarea:on_hide()
	end		
			
end

	


	