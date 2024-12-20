
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

formulatypeaddFrame = inherit(GmBase.FrameBase):name("formulatypeaddFrame")

formulatypeaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_formulatypeadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaformulatypeaddarea
	self.areaformulatypeaddarea = gm_xinbanchunzhongyun.formulatypeaddareaArea(self)
	
	if self.areaformulatypeaddarea.set then
				
	end
	
		if self.areaformulatypeaddarea.set_title then
			self.areaformulatypeaddarea:set_title('添加公式分类')
		elseif self.areaformulatypeaddarea.set then
			self.areaformulatypeaddarea:set('title','添加公式分类')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaformulatypeaddarea
	
	self:set_style('display:none')

	
end


formulatypeaddFrame.set_data_id = function(self,data)
	
	if self.areaformulatypeaddarea.set_data_id then
		self.areaformulatypeaddarea:set_data_id(data)
	end
				
end


formulatypeaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaformulatypeaddarea.set_data then
		self.areaformulatypeaddarea:set_data(data)
	end
			
end




formulatypeaddFrame.on_show = function(self)
			
	if self.areaformulatypeaddarea.on_show then
		self.areaformulatypeaddarea:on_show()
	end
			
end


formulatypeaddFrame.on_hide = function(self)
			
	if self.areaformulatypeaddarea.on_hide then
		self.areaformulatypeaddarea:on_hide()
	end		
			
end

	


	