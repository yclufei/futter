
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

settinFrame = inherit(GmBase.FrameBase):name("settinFrame")

settinFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_settin"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
			-- otherwise
			
	
	self.mainarea = self.areasettinarea
	
	self:set_style('display:none')

	
end


settinFrame.set_data_id = function(self,data)
	
	if self.areaattr.set_data_id then
		self.areaattr:set_data_id(data)
	end
				
end


settinFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaattr.set_data then
		self.areaattr:set_data(data)
	end
			
end




settinFrame.on_show = function(self)
			
	if self.areaattr.on_show then
		self.areaattr:on_show()
	end
			
end


settinFrame.on_hide = function(self)
			
	if self.areaattr.on_hide then
		self.areaattr:on_hide()
	end		
			
end

	


	