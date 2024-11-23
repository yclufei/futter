
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

servicemodifyFrame = inherit(GmBase.FrameBase):name("servicemodifyFrame")

servicemodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_servicemodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areaservicemodifyarea
	self.areaservicemodifyarea = gm_ruanjianwaibaojiaoyisuo.servicemodifyareaArea(self)
	
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
			self.areanav:set_title('servicemodify')
		elseif self.areanav.set then
			self.areanav:set('title','servicemodify')
		end
					
	
	self.mainarea = self.areaservicemodifyarea
	
	self:set_style('display:none')

	
end


servicemodifyFrame.set_data_id = function(self,data)
	
	if self.areaservicemodifyarea.set_data_id then
		self.areaservicemodifyarea:set_data_id(data)
	end
				
end


servicemodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaservicemodifyarea.set_data then
		self.areaservicemodifyarea:set_data(data)
	end
			
end




servicemodifyFrame.on_show = function(self)
			
	if self.areaservicemodifyarea.on_show then
		self.areaservicemodifyarea:on_show()
	end
			
end


servicemodifyFrame.on_hide = function(self)
			
	if self.areaservicemodifyarea.on_hide then
		self.areaservicemodifyarea:on_hide()
	end		
			
end

	


	