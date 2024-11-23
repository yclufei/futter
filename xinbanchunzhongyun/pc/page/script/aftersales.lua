
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

aftersalesFrame = inherit(GmBase.FrameBase):name("aftersalesFrame")

aftersalesFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_aftersales"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaaftersalesarea
	self.areaaftersalesarea = gm_xinbanchunzhongyun.aftersalesareaArea(self)
	
	if self.areaaftersalesarea.set then
				
	end
	
		if self.areaaftersalesarea.set_title then
			self.areaaftersalesarea:set_title('售后部门')
		elseif self.areaaftersalesarea.set then
			self.areaaftersalesarea:set('title','售后部门')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaaftersalesarea
	
	self:set_style('display:none')

	
end


aftersalesFrame.set_data_id = function(self,data)
	
	if self.areaaftersalesarea.set_data_id then
		self.areaaftersalesarea:set_data_id(data)
	end
				
end


aftersalesFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaaftersalesarea.set_data then
		self.areaaftersalesarea:set_data(data)
	end
			
end




aftersalesFrame.on_show = function(self)
			
	if self.areaaftersalesarea.on_show then
		self.areaaftersalesarea:on_show()
	end
			
end


aftersalesFrame.on_hide = function(self)
			
	if self.areaaftersalesarea.on_hide then
		self.areaaftersalesarea:on_hide()
	end		
			
end

	


	