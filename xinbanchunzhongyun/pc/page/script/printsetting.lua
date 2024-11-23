
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

printsettingFrame = inherit(GmBase.FrameBase):name("printsettingFrame")

printsettingFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_printsetting"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaprintsettingarea
	self.areaprintsettingarea = gm_xinbanchunzhongyun.printsettingareaArea(self)
	
	if self.areaprintsettingarea.set then
				
	end
	
		if self.areaprintsettingarea.set_title then
			self.areaprintsettingarea:set_title('打印设置')
		elseif self.areaprintsettingarea.set then
			self.areaprintsettingarea:set('title','打印设置')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaprintsettingarea
	
	self:set_style('display:none')

	
end


printsettingFrame.set_data_id = function(self,data)
	
	if self.areaprintsettingarea.set_data_id then
		self.areaprintsettingarea:set_data_id(data)
	end
				
end


printsettingFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaprintsettingarea.set_data then
		self.areaprintsettingarea:set_data(data)
	end
			
end




printsettingFrame.on_show = function(self)
			
	if self.areaprintsettingarea.on_show then
		self.areaprintsettingarea:on_show()
	end
			
end


printsettingFrame.on_hide = function(self)
			
	if self.areaprintsettingarea.on_hide then
		self.areaprintsettingarea:on_hide()
	end		
			
end

	


	