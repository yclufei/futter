
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

quotationsFrame = inherit(GmBase.FrameBase):name("quotationsFrame")

quotationsFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_quotations"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaquotationsarea
	self.areaquotationsarea = gm_chayegongsi.quotationsareaArea(self)
	
	if self.areaquotationsarea.set then
				
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
			self.areanav:set_title('行情中心')
		elseif self.areanav.set then
			self.areanav:set('title','行情中心')
		end
					
	
	self.mainarea = self.areaquotationsarea
	
	self:set_style('display:none')

	
end


quotationsFrame.set_data_id = function(self,data)
	
	if self.areaquotationsarea.set_data_id then
		self.areaquotationsarea:set_data_id(data)
	end
				
end


quotationsFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaquotationsarea.set_data then
		self.areaquotationsarea:set_data(data)
	end
			
end




quotationsFrame.on_show = function(self)
			
	if self.areaquotationsarea.on_show then
		self.areaquotationsarea:on_show()
	end
			
end


quotationsFrame.on_hide = function(self)
			
	if self.areaquotationsarea.on_hide then
		self.areaquotationsarea:on_hide()
	end		
			
end

	


	