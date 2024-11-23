
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

serviceaddFrame = inherit(GmBase.FrameBase):name("serviceaddFrame")

serviceaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_serviceadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areaserviceaddarea
	self.areaserviceaddarea = gm_ruanjianwaibaojiaoyisuo.serviceaddareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('发布服务')
		elseif self.areanav.set then
			self.areanav:set('title','发布服务')
		end
					
	
	self.mainarea = self.areaserviceaddarea
	
	self:set_style('display:none')

	
end


serviceaddFrame.set_data_id = function(self,data)
	
	if self.areaserviceaddarea.set_data_id then
		self.areaserviceaddarea:set_data_id(data)
	end
				
end


serviceaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaserviceaddarea.set_data then
		self.areaserviceaddarea:set_data(data)
	end
			
end




serviceaddFrame.on_show = function(self)
			
	if self.areaserviceaddarea.on_show then
		self.areaserviceaddarea:on_show()
	end
			
end


serviceaddFrame.on_hide = function(self)
			
	if self.areaserviceaddarea.on_hide then
		self.areaserviceaddarea:on_hide()
	end		
			
end

	


	