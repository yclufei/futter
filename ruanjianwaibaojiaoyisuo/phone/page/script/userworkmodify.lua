
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

userworkmodifyFrame = inherit(GmBase.FrameBase):name("userworkmodifyFrame")

userworkmodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_userworkmodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areauserworkmodifyarea
	self.areauserworkmodifyarea = gm_ruanjianwaibaojiaoyisuo.userworkmodifyareaArea(self)

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
		self.areanav:set_title('工作信息')
	elseif self.areanav.set then
		self.areanav:set('title','工作信息')
	end
				
	
				
	local rcss = 'fa_save font45 paddingTop15'
	if self.areanav.set_rightcss then
		self.areanav:set_rightcss(rcss)
	elseif self.areanav.set then
		self.areanav:set('rightcss',rcss)
	end
	
	self.areanav.rightfunc = function(link)
		top.mainarea:save()
	end
			
			
			
	self.mainarea = self.areauserworkmodifyarea
	
	self:set_style('display:none')

	
end


userworkmodifyFrame.set_data_id = function(self,data)
	
	if self.areauserworkmodifyarea.set_data_id then
		self.areauserworkmodifyarea:set_data_id(data)
	end
				
end


userworkmodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areauserworkmodifyarea.set_data then
		self.areauserworkmodifyarea:set_data(data)
	end
			
end




userworkmodifyFrame.on_show = function(self)
			
	if self.areauserworkmodifyarea.on_show then
		self.areauserworkmodifyarea:on_show()
	end
			
end


userworkmodifyFrame.on_hide = function(self)
			
	if self.areauserworkmodifyarea.on_hide then
		self.areauserworkmodifyarea:on_hide()
	end		
			
end

	


	