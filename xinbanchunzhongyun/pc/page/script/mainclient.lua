
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

mainclientFrame = inherit(GmBase.FrameBase):name("mainclientFrame")

mainclientFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_mainclient"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areamainmenu
	self.areamainmenu = gm_xinbanchunzhongyun.mainmenuArea(self)
	
	if self.areamainmenu.set then
				
	end
	
	-- areamainclientarea
	self.areamainclientarea = gm_xinbanchunzhongyun.mainclientareaArea(self)
	
	if self.areamainclientarea.set then
				
	end
	
		if self.areamainclientarea.set_title then
			self.areamainclientarea:set_title('客户')
		elseif self.areamainclientarea.set then
			self.areamainclientarea:set('title','客户')
		end
					
	
	self.mainarea = self.areamainclientarea
	
	self:set_style('display:none')

	
end


mainclientFrame.set_data_id = function(self,data)
	
	if self.areamainclientarea.set_data_id then
		self.areamainclientarea:set_data_id(data)
	end
				
end


mainclientFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areamainclientarea.set_data then
		self.areamainclientarea:set_data(data)
	end
			
end




mainclientFrame.on_show = function(self)
			
	if self.areamainclientarea.on_show then
		self.areamainclientarea:on_show()
	end
			
end


mainclientFrame.on_hide = function(self)
			
	if self.areamainclientarea.on_hide then
		self.areamainclientarea:on_hide()
	end		
			
end

	


	