
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_minjieyingshi")

sortlistFrame = inherit(GmBase.FrameBase):name("sortlistFrame")

sortlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_sortlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_minjieyingshi.navArea(self)
	
	-- areasortlistarea
	self.areasortlistarea = gm_minjieyingshi.sortlistareaArea(self)
	
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
			self.areanav:set_title('排行')
		elseif self.areanav.set then
			self.areanav:set('title','排行')
		end
					
	
	self.mainarea = self.areasortlistarea
	
	self:set_style('display:none')

	
end


sortlistFrame.set_data_id = function(self,data)
	
	if self.areasortlistarea.set_data_id then
		self.areasortlistarea:set_data_id(data)
	end
				
end


sortlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areasortlistarea.set_data then
		self.areasortlistarea:set_data(data)
	end
			
end




sortlistFrame.on_show = function(self)
			
	if self.areasortlistarea.on_show then
		self.areasortlistarea:on_show()
	end
			
end


sortlistFrame.on_hide = function(self)
			
	if self.areasortlistarea.on_hide then
		self.areasortlistarea:on_hide()
	end		
			
end

	


	