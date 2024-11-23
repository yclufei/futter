
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

useridnmodifyFrame = inherit(GmBase.FrameBase):name("useridnmodifyFrame")

useridnmodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_useridnmodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areauseridnmodifyarea
	self.areauseridnmodifyarea = gm_ruanjianwaibaojiaoyisuo.useridnmodifyareaArea(self)
	
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
		self.areanav:set_title('身份信息')
	elseif self.areanav.set then
		self.areanav:set('title','身份信息')
	end
				
	
	self.mainarea = self.areauseridnmodifyarea
	
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


useridnmodifyFrame.set_data_id = function(self,data)
	
	if self.areauseridnmodifyarea.set_data_id then
		self.areauseridnmodifyarea:set_data_id(data)
	end
				
end


useridnmodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areauseridnmodifyarea.set_data then
		self.areauseridnmodifyarea:set_data(data)
	end
			
end




useridnmodifyFrame.on_show = function(self)
			
	if self.areauseridnmodifyarea.on_show then
		self.areauseridnmodifyarea:on_show()
	end
			
end


useridnmodifyFrame.on_hide = function(self)
			
	if self.areauseridnmodifyarea.on_hide then
		self.areauseridnmodifyarea:on_hide()
	end		
			
end

	


	