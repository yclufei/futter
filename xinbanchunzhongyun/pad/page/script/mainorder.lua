
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

mainorderFrame = inherit(GmBase.FrameBase):name("mainorderFrame")

mainorderFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_mainorder"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areamainmenu
	self.areamainmenu = gm_xinbanchunzhongyun.mainmenuArea(self)
	
	if self.areamainmenu.set then
				
	end
	
	-- areamainorderarea
	self.areamainorderarea = gm_xinbanchunzhongyun.mainorderareaArea(self)
	
	if self.areamainorderarea.set then
				
	end
	
		if self.areamainorderarea.set_title then
			self.areamainorderarea:set_title('订单')
		elseif self.areamainorderarea.set then
			self.areamainorderarea:set('title','订单')
		end
					
	
	self.mainarea = self.areamainorderarea
	
	self:set_style('display:none')

	
end


mainorderFrame.set_data_id = function(self,data)
	
	if self.areamainorderarea.set_data_id then
		self.areamainorderarea:set_data_id(data)
	end
				
end


mainorderFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areamainorderarea.set_data then
		self.areamainorderarea:set_data(data)
	end
			
end




mainorderFrame.on_show = function(self)
			
	if self.areamainorderarea.on_show then
		self.areamainorderarea:on_show()
	end
			
end


mainorderFrame.on_hide = function(self)
			
	if self.areamainorderarea.on_hide then
		self.areamainorderarea:on_hide()
	end		
			
end

	


	