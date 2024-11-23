
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

formulatypemgrFrame = inherit(GmBase.FrameBase):name("formulatypemgrFrame")

formulatypemgrFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_formulatypemgr"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaformulatypemgrarea
	self.areaformulatypemgrarea = gm_xinbanchunzhongyun.formulatypemgrareaArea(self)
	
	if self.areaformulatypemgrarea.set then
				
	end
	
		if self.areaformulatypemgrarea.set_title then
			self.areaformulatypemgrarea:set_title('公式分类管理')
		elseif self.areaformulatypemgrarea.set then
			self.areaformulatypemgrarea:set('title','公式分类管理')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaformulatypemgrarea
	
	self:set_style('display:none')

	
end


formulatypemgrFrame.set_data_id = function(self,data)
	
	if self.areaformulatypemgrarea.set_data_id then
		self.areaformulatypemgrarea:set_data_id(data)
	end
				
end


formulatypemgrFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaformulatypemgrarea.set_data then
		self.areaformulatypemgrarea:set_data(data)
	end
			
end




formulatypemgrFrame.on_show = function(self)
			
	if self.areaformulatypemgrarea.on_show then
		self.areaformulatypemgrarea:on_show()
	end
			
end


formulatypemgrFrame.on_hide = function(self)
			
	if self.areaformulatypemgrarea.on_hide then
		self.areaformulatypemgrarea:on_hide()
	end		
			
end

	


	