
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

usercontactmodifyFrame = inherit(GmBase.FrameBase):name("usercontactmodifyFrame")

usercontactmodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_usercontactmodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areausercontactmodifyarea
	self.areausercontactmodifyarea = gm_ruanjianwaibaojiaoyisuo.usercontactmodifyareaArea(self)
	
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
			self.areanav:set_title('联系方式')
		elseif self.areanav.set then
			self.areanav:set('title','联系方式')
		end
					
	
	self.mainarea = self.areausercontactmodifyarea
	
	local rcss = 'fa_save font45 paddingTop15'
	if self.areanav.set_rightcss then
		self.areanav:set_rightcss(rcss)
	elseif self.areanav.set then
		self.areanav:set('rightcss',rcss)
	end
	
	self.areanav.rightfunc = function(link)
		top.mainarea:save()
	end
			
	self:set_style('display:none')

	
end


usercontactmodifyFrame.set_data_id = function(self,data)
	
	if self.areausercontactmodifyarea.set_data_id then
		self.areausercontactmodifyarea:set_data_id(data)
	end
				
end


usercontactmodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areausercontactmodifyarea.set_data then
		self.areausercontactmodifyarea:set_data(data)
	end
			
end




usercontactmodifyFrame.on_show = function(self)
			
	if self.areausercontactmodifyarea.on_show then
		self.areausercontactmodifyarea:on_show()
	end
			
end


usercontactmodifyFrame.on_hide = function(self)
			
	if self.areausercontactmodifyarea.on_hide then
		self.areausercontactmodifyarea:on_hide()
	end		
			
end

	


	