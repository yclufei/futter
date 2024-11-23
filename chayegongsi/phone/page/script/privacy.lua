
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

privacyFrame = inherit(GmBase.FrameBase):name("privacyFrame")

privacyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_privacy"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaprivacyarea
	self.areaprivacyarea = gm_chayegongsi.privacyareaArea(self)
	
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
			self.areanav:set_title('隐私政策')
		elseif self.areanav.set then
			self.areanav:set('title','隐私政策')
		end
					
	
	self.mainarea = self.areaprivacyarea
	
	self:set_style('display:none')

	
end


privacyFrame.set_data_id = function(self,data)
	
	if self.areaprivacyarea.set_data_id then
		self.areaprivacyarea:set_data_id(data)
	end
				
end


privacyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaprivacyarea.set_data then
		self.areaprivacyarea:set_data(data)
	end
			
end




privacyFrame.on_show = function(self)
			
	if self.areaprivacyarea.on_show then
		self.areaprivacyarea:on_show()
	end
			
end


privacyFrame.on_hide = function(self)
			
	if self.areaprivacyarea.on_hide then
		self.areaprivacyarea:on_hide()
	end		
			
end

	


	