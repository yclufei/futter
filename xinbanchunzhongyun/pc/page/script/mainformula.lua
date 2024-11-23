
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

mainformulaFrame = inherit(GmBase.FrameBase):name("mainformulaFrame")

mainformulaFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_mainformula"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areamainmenu
	self.areamainmenu = gm_xinbanchunzhongyun.mainmenuArea(self)
	
	if self.areamainmenu.set then
				
	end
	
	-- areamainformulaarea
	self.areamainformulaarea = gm_xinbanchunzhongyun.mainformulaareaArea(self)
	
	if self.areamainformulaarea.set then
				
	end
	
		if self.areamainformulaarea.set_title then
			self.areamainformulaarea:set_title('公式')
		elseif self.areamainformulaarea.set then
			self.areamainformulaarea:set('title','公式')
		end
					
	
	self.mainarea = self.areamainformulaarea
	
	self:set_style('display:none')

	
end


mainformulaFrame.set_data_id = function(self,data)
	
	if self.areamainformulaarea.set_data_id then
		self.areamainformulaarea:set_data_id(data)
	end
				
end


mainformulaFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areamainformulaarea.set_data then
		self.areamainformulaarea:set_data(data)
	end
			
end




mainformulaFrame.on_show = function(self)
			
	if self.areamainformulaarea.on_show then
		self.areamainformulaarea:on_show()
	end
			
end


mainformulaFrame.on_hide = function(self)
			
	if self.areamainformulaarea.on_hide then
		self.areamainformulaarea:on_hide()
	end		
			
end

	


	