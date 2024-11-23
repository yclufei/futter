
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_chayegongsi")

mysalebillFrame = inherit(GmBase.FrameBase):name("mysalebillFrame")

mysalebillFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_mysalebill"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areamysalebillarea
	self.areamysalebillarea = gm_chayegongsi.mysalebillareaArea(self)
	
	if self.areamysalebillarea.set then
				
	end
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('我的售卖订单')
		elseif self.areanav.set then
			self.areanav:set('title','我的售卖订单')
		end
					
	
	self.mainarea = self.areamysalebillarea
	
	self:set_style('display:none')

	
end


mysalebillFrame.set_data_id = function(self,data)
	
	if self.areamysalebillarea.set_data_id then
		self.areamysalebillarea:set_data_id(data)
	end
				
end


mysalebillFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areamysalebillarea.set_data then
		self.areamysalebillarea:set_data(data)
	end
			
end




mysalebillFrame.on_show = function(self)
			
	if self.areamysalebillarea.on_show then
		self.areamysalebillarea:on_show()
	end
			
end


mysalebillFrame.on_hide = function(self)
			
	if self.areamysalebillarea.on_hide then
		self.areamysalebillarea:on_hide()
	end		
			
end

	


	