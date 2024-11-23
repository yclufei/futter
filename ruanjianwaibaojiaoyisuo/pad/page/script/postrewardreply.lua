
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

postrewardreplyFrame = inherit(GmBase.FrameBase):name("postrewardreplyFrame")

postrewardreplyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_postrewardreply"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
			-- otherwise
			
	
	self.mainarea = self.areapostrewardreplyarea
	
	self:set_style('display:none')

	
end


postrewardreplyFrame.set_data_id = function(self,data)
	
	if self.areaattr.set_data_id then
		self.areaattr:set_data_id(data)
	end
				
end


postrewardreplyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaattr.set_data then
		self.areaattr:set_data(data)
	end
			
end




postrewardreplyFrame.on_show = function(self)
			
	if self.areaattr.on_show then
		self.areaattr:on_show()
	end
			
end


postrewardreplyFrame.on_hide = function(self)
			
	if self.areaattr.on_hide then
		self.areaattr:on_hide()
	end		
			
end

	


	