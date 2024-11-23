
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

ranklistlistFrame = inherit(GmBase.FrameBase):name("ranklistlistFrame")

ranklistlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_ranklistlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- arearanklistlistarea
	self.arearanklistlistarea = gm_chayegongsi.ranklistlistareaArea(self)
	
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
			self.areanav:set_title('ranklistlist')
		elseif self.areanav.set then
			self.areanav:set('title','ranklistlist')
		end
					
	
	self.mainarea = self.arearanklistlistarea
	
	self:set_style('display:none')

	
end


ranklistlistFrame.set_data_id = function(self,data)
	
	if self.arearanklistlistarea.set_data_id then
		self.arearanklistlistarea:set_data_id(data)
	end
				
end


ranklistlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearanklistlistarea.set_data then
		self.arearanklistlistarea:set_data(data)
	end
			
end




ranklistlistFrame.on_show = function(self)
			
	if self.arearanklistlistarea.on_show then
		self.arearanklistlistarea:on_show()
	end
			
end


ranklistlistFrame.on_hide = function(self)
			
	if self.arearanklistlistarea.on_hide then
		self.arearanklistlistarea:on_hide()
	end		
			
end

	


	