
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_chayegongsi")

buyedFrame = inherit(GmBase.FrameBase):name("buyedFrame")

buyedFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_buyed"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areabuyedarea
	self.areabuyedarea = gm_chayegongsi.buyedareaArea(self)
	
	if self.areabuyedarea.set then
				
	end
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('已采购')
		elseif self.areanav.set then
			self.areanav:set('title','已采购')
		end
					
	
	self.mainarea = self.areabuyedarea
	
	self:set_style('display:none')

	
end


buyedFrame.set_data_id = function(self,data)
	
	if self.areabuyedarea.set_data_id then
		self.areabuyedarea:set_data_id(data)
	end
				
end


buyedFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areabuyedarea.set_data then
		self.areabuyedarea:set_data(data)
	end
			
end




buyedFrame.on_show = function(self)
			
	if self.areabuyedarea.on_show then
		self.areabuyedarea:on_show()
	end
			
end


buyedFrame.on_hide = function(self)
			
	if self.areabuyedarea.on_hide then
		self.areabuyedarea:on_hide()
	end		
			
end

	


	