
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

speteadetailFrame = inherit(GmBase.FrameBase):name("speteadetailFrame")

speteadetailFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_speteadetail"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaspeteadetailarea
	self.areaspeteadetailarea = gm_chayegongsi.speteadetailareaArea(self)
	
	if self.areaspeteadetailarea.set then
				
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
			self.areanav:set_title('特色茶叶详情')
		elseif self.areanav.set then
			self.areanav:set('title','特色茶叶详情')
		end
					
	
	self.mainarea = self.areaspeteadetailarea
	
	self:set_style('display:none')

	
end


speteadetailFrame.set_data_id = function(self,data)
	
	if self.areaspeteadetailarea.set_data_id then
		self.areaspeteadetailarea:set_data_id(data)
	end
				
end


speteadetailFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaspeteadetailarea.set_data then
		self.areaspeteadetailarea:set_data(data)
	end
			
end




speteadetailFrame.on_show = function(self)
			
	if self.areaspeteadetailarea.on_show then
		self.areaspeteadetailarea:on_show()
	end
			
end


speteadetailFrame.on_hide = function(self)
			
	if self.areaspeteadetailarea.on_hide then
		self.areaspeteadetailarea:on_hide()
	end		
			
end

	


	