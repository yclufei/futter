
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

dealercheckorderFrame = inherit(GmBase.FrameBase):name("dealercheckorderFrame")

dealercheckorderFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_dealercheckorder"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areadealercheckorderarea
	self.areadealercheckorderarea = gm_xinbanchunzhongyun.dealercheckorderareaArea(self)
	
	if self.areadealercheckorderarea.set then
				
	end
	
		if self.areadealercheckorderarea.set_title then
			self.areadealercheckorderarea:set_title('经销商查单')
		elseif self.areadealercheckorderarea.set then
			self.areadealercheckorderarea:set('title','经销商查单')
		end
					
	
	self.mainarea = self.areadealercheckorderarea
	
	self:set_style('display:none')

	
end


dealercheckorderFrame.set_data_id = function(self,data)
	
	if self.areadealercheckorderarea.set_data_id then
		self.areadealercheckorderarea:set_data_id(data)
	end
				
end


dealercheckorderFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areadealercheckorderarea.set_data then
		self.areadealercheckorderarea:set_data(data)
	end
			
end




dealercheckorderFrame.on_show = function(self)
			
	if self.areadealercheckorderarea.on_show then
		self.areadealercheckorderarea:on_show()
	end
			
end


dealercheckorderFrame.on_hide = function(self)
			
	if self.areadealercheckorderarea.on_hide then
		self.areadealercheckorderarea:on_hide()
	end		
			
end

	


	