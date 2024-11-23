
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

registerFrame = inherit(GmBase.FrameBase):name("registerFrame")

registerFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_register"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- arearegisterarea
	self.arearegisterarea = gm_ruanjianwaibaojiaoyisuo.registerareaArea(self)
	
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
			self.areanav:set_title('注册')
		elseif self.areanav.set then
			self.areanav:set('title','注册')
		end
					
	
	self.mainarea = self.arearegisterarea
	
	self:set_style('display:none')

	
end


registerFrame.set_data_id = function(self,data)
	
	if self.arearegisterarea.set_data_id then
		self.arearegisterarea:set_data_id(data)
	end
				
end


registerFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearegisterarea.set_data then
		self.arearegisterarea:set_data(data)
	end
			
end




registerFrame.on_show = function(self)
			
	if self.arearegisterarea.on_show then
		self.arearegisterarea:on_show()
	end
			
end


registerFrame.on_hide = function(self)
			
	if self.arearegisterarea.on_hide then
		self.arearegisterarea:on_hide()
	end		
			
end

	


	