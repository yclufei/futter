
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

introFrame = inherit(GmBase.FrameBase):name("introFrame")

introFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_intro"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaintroarea
	self.areaintroarea = gm_xinbanchunzhongyun.introareaArea(self)
	
	if self.areaintroarea.set then
				
	end
	
		if self.areaintroarea.set_title then
			self.areaintroarea:set_title('公司介绍')
		elseif self.areaintroarea.set then
			self.areaintroarea:set('title','公司介绍')
		end
					
	
	self.mainarea = self.areaintroarea
	
	self:set_style('display:none')

	
end


introFrame.set_data_id = function(self,data)
	
	if self.areaintroarea.set_data_id then
		self.areaintroarea:set_data_id(data)
	end
				
end


introFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaintroarea.set_data then
		self.areaintroarea:set_data(data)
	end
			
end




introFrame.on_show = function(self)
			
	if self.areaintroarea.on_show then
		self.areaintroarea:on_show()
	end
			
end


introFrame.on_hide = function(self)
			
	if self.areaintroarea.on_hide then
		self.areaintroarea:on_hide()
	end		
			
end

	


	