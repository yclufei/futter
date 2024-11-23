
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

quickformFrame = inherit(GmBase.FrameBase):name("quickformFrame")

quickformFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_quickform"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaquickformarea
	self.areaquickformarea = gm_xinbanchunzhongyun.quickformareaArea(self)
	
	if self.areaquickformarea.set then
				
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
			self.areanav:set_title('快速下单表')
		elseif self.areanav.set then
			self.areanav:set('title','快速下单表')
		end
					
		if self.areaquickformarea.set_title then
			self.areaquickformarea:set_title('快速下单表')
		elseif self.areaquickformarea.set then
			self.areaquickformarea:set('title','快速下单表')
		end
					
	
	self.mainarea = self.areaquickformarea
	
	self:set_style('display:none')

	
end


quickformFrame.set_data_id = function(self,data)
	
	if self.areaquickformarea.set_data_id then
		self.areaquickformarea:set_data_id(data)
	end
				
end


quickformFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaquickformarea.set_data then
		self.areaquickformarea:set_data(data)
	end
			
end




quickformFrame.on_show = function(self)
			
	if self.areaquickformarea.on_show then
		self.areaquickformarea:on_show()
	end
			
end


quickformFrame.on_hide = function(self)
			
	if self.areaquickformarea.on_hide then
		self.areaquickformarea:on_hide()
	end		
			
end

	


	