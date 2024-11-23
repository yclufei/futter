
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

smsettingFrame = inherit(GmBase.FrameBase):name("smsettingFrame")

smsettingFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_smsetting"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areasmsettingarea
	self.areasmsettingarea = gm_xinbanchunzhongyun.smsettingareaArea(self)
	
	if self.areasmsettingarea.set then
				
	end
	
		if self.areasmsettingarea.set_title then
			self.areasmsettingarea:set_title('短信设置')
		elseif self.areasmsettingarea.set then
			self.areasmsettingarea:set('title','短信设置')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areasmsettingarea
	
	self:set_style('display:none')

	
end


smsettingFrame.set_data_id = function(self,data)
	
	if self.areasmsettingarea.set_data_id then
		self.areasmsettingarea:set_data_id(data)
	end
				
end


smsettingFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areasmsettingarea.set_data then
		self.areasmsettingarea:set_data(data)
	end
			
end




smsettingFrame.on_show = function(self)
			
	if self.areasmsettingarea.on_show then
		self.areasmsettingarea:on_show()
	end
			
end


smsettingFrame.on_hide = function(self)
			
	if self.areasmsettingarea.on_hide then
		self.areasmsettingarea:on_hide()
	end		
			
end

	


	