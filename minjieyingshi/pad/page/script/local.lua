
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_minjieyingshi")

localFrame = inherit(GmBase.FrameBase):name("localFrame")

localFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_local"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- arealocalarea
	self.arealocalarea = gm_minjieyingshi.localareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('本地')
		elseif self.areanav.set then
			self.areanav:set('title','本地')
		end
					
	
	self.mainarea = self.arealocalarea
	
	self:set_style('display:none')

	
end


localFrame.set_data_id = function(self,data)
	
	if self.arealocalarea.set_data_id then
		self.arealocalarea:set_data_id(data)
	end
				
end


localFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arealocalarea.set_data then
		self.arealocalarea:set_data(data)
	end
			
end




localFrame.on_show = function(self)
			
	if self.arealocalarea.on_show then
		self.arealocalarea:on_show()
	end
			
end


localFrame.on_hide = function(self)
			
	if self.arealocalarea.on_hide then
		self.arealocalarea:on_hide()
	end		
			
end

	


	