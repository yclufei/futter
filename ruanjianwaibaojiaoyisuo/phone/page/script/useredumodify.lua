
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

useredumodifyFrame = inherit(GmBase.FrameBase):name("useredumodifyFrame")

useredumodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_useredumodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areauseredumodifyarea
	self.areauseredumodifyarea = gm_ruanjianwaibaojiaoyisuo.useredumodifyareaArea(self)
	
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
			self.areanav:set_title('教育信息')
		elseif self.areanav.set then
			self.areanav:set('title','教育信息')
		end
					
	
	self.mainarea = self.areauseredumodifyarea
	
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


useredumodifyFrame.set_data_id = function(self,data)
	
	if self.areauseredumodifyarea.set_data_id then
		self.areauseredumodifyarea:set_data_id(data)
	end
				
end


useredumodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areauseredumodifyarea.set_data then
		self.areauseredumodifyarea:set_data(data)
	end
			
end




useredumodifyFrame.on_show = function(self)
			
	if self.areauseredumodifyarea.on_show then
		self.areauseredumodifyarea:on_show()
	end
			
end


useredumodifyFrame.on_hide = function(self)
			
	if self.areauseredumodifyarea.on_hide then
		self.areauseredumodifyarea:on_hide()
	end		
			
end

	


	