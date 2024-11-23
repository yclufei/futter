
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_chayegongsi")

billFrame = inherit(GmBase.FrameBase):name("billFrame")

billFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_bill"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areabillarea
	self.areabillarea = gm_chayegongsi.billareaArea(self)
	
	if self.areabillarea.set then
				
	end
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('农户交易账单')
		elseif self.areanav.set then
			self.areanav:set('title','农户交易账单')
		end
					
	
	self.mainarea = self.areabillarea
	
	self:set_style('display:none')

	
end


billFrame.set_data_id = function(self,data)
	
	if self.areabillarea.set_data_id then
		self.areabillarea:set_data_id(data)
	end
				
end


billFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areabillarea.set_data then
		self.areabillarea:set_data(data)
	end
			
end




billFrame.on_show = function(self)
			
	if self.areabillarea.on_show then
		self.areabillarea:on_show()
	end
			
end


billFrame.on_hide = function(self)
			
	if self.areabillarea.on_hide then
		self.areabillarea:on_hide()
	end		
			
end

	


	