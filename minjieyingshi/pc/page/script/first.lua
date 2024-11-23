
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_minjieyingshi")

firstFrame = inherit(GmBase.FrameBase):name("firstFrame")

firstFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_first"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- mainarea
	self.mainarea = gm_minjieyingshi.firstareaArea(self)
	
	if self.mainarea.set then
		
		self.mainarea:set('fid','2')
		
		self.mainarea:set('fid','2')
		
		self.mainarea:set('closed','0')
				
	end
	
	self:set_style('display:none')

	
end


firstFrame.set_data_id = function(self,data)
	
	if self.mainarea.set_data_id then
		self.mainarea:set_data_id(data)
	end
				
end


firstFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.mainarea.set_data then
		self.mainarea:set_data(data)
	end
			
end




firstFrame.on_show = function(self)
			
	if self.mainarea.on_show then
		self.mainarea:on_show()
	end
			
end


firstFrame.on_hide = function(self)
			
	if self.mainarea.on_hide then
		self.mainarea:on_hide()
	end		
			
end

	


	