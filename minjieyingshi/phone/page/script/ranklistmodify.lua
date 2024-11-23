
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_minjieyingshi")

ranklistmodifyFrame = inherit(GmBase.FrameBase):name("ranklistmodifyFrame")

ranklistmodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_ranklistmodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- arearanklistmodifyarea
	self.arearanklistmodifyarea = gm_minjieyingshi.ranklistmodifyareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_leftcss then
			self.areanav:set_leftcss('fa-fa-angle-left font45')
		elseif self.areanav.set then
			self.areanav:set('leftcss','fa-fa-angle-left font45')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('ranklistmodify')
		elseif self.areanav.set then
			self.areanav:set('title','ranklistmodify')
		end
					
	
	self.mainarea = self.arearanklistmodifyarea
	
	self:set_style('display:none')

	
end


ranklistmodifyFrame.set_data_id = function(self,data)
	
	if self.arearanklistmodifyarea.set_data_id then
		self.arearanklistmodifyarea:set_data_id(data)
	end
				
end


ranklistmodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearanklistmodifyarea.set_data then
		self.arearanklistmodifyarea:set_data(data)
	end
			
end




ranklistmodifyFrame.on_show = function(self)
			
	if self.arearanklistmodifyarea.on_show then
		self.arearanklistmodifyarea:on_show()
	end
			
end


ranklistmodifyFrame.on_hide = function(self)
			
	if self.arearanklistmodifyarea.on_hide then
		self.arearanklistmodifyarea:on_hide()
	end		
			
end

	


	