
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

tradeFrame = inherit(GmBase.FrameBase):name("tradeFrame")

tradeFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_trade"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areatradearea
	self.areatradearea = gm_chayegongsi.tradeareaArea(self)
	
	if self.areatradearea.set then
				
	end
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_leftcss then
			self.areanav:set_leftcss('fa-angle-left font45')
		elseif self.areanav.set then
			self.areanav:set('leftcss','fa-angle-left font45')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('交易大厅')
		elseif self.areanav.set then
			self.areanav:set('title','交易大厅')
		end
					
	
	self.mainarea = self.areatradearea
	
	self:set_style('display:none')

	
end


tradeFrame.set_data_id = function(self,data)
	
	if self.areatradearea.set_data_id then
		self.areatradearea:set_data_id(data)
	end
				
end


tradeFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areatradearea.set_data then
		self.areatradearea:set_data(data)
	end
			
end




tradeFrame.on_show = function(self)
			
	if self.areatradearea.on_show then
		self.areatradearea:on_show()
	end
			
end


tradeFrame.on_hide = function(self)
			
	if self.areatradearea.on_hide then
		self.areatradearea:on_hide()
	end		
			
end

	


	