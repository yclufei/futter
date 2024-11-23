
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

mainproductFrame = inherit(GmBase.FrameBase):name("mainproductFrame")

mainproductFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_mainproduct"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areamainproductarea
	self.areamainproductarea = gm_xinbanchunzhongyun.mainproductareaArea(self)
	
	if self.areamainproductarea.set then
				
	end
	
	-- areamainmenu
	self.areamainmenu = gm_xinbanchunzhongyun.mainmenuArea(self)
	
	if self.areamainmenu.set then
				
	end
	
		if self.areamainproductarea.set_title then
			self.areamainproductarea:set_title('产品')
		elseif self.areamainproductarea.set then
			self.areamainproductarea:set('title','产品')
		end
					
	
	self.mainarea = self.areamainproductarea
	
	self:set_style('display:none')

	
end


mainproductFrame.set_data_id = function(self,data)
	
	if self.areamainproductarea.set_data_id then
		self.areamainproductarea:set_data_id(data)
	end
				
end


mainproductFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areamainproductarea.set_data then
		self.areamainproductarea:set_data(data)
	end
			
end




mainproductFrame.on_show = function(self)
			
	if self.areamainproductarea.on_show then
		self.areamainproductarea:on_show()
	end
			
end


mainproductFrame.on_hide = function(self)
			
	if self.areamainproductarea.on_hide then
		self.areamainproductarea:on_hide()
	end		
			
end

	


	