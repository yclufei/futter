
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

circleFrame = inherit(GmBase.FrameBase):name("circleFrame")

circleFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_circle"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areacirclearea
	self.areacirclearea = gm_ruanjianwaibaojiaoyisuo.circleareaArea(self)
	
	if self.areacirclearea.set then
		
		self.areacirclearea:set('reftype','member')
		
		self.areacirclearea:set('refview','credit')
		
		self.areacirclearea:set('__update','true')
				
	end
	
	-- areamainmenu
	self.areamainmenu = gm_ruanjianwaibaojiaoyisuo.mainmenuArea(self)
	

	self.areamainmenu:set_index(3)

	if self.areanav.set_right then
		self.areanav:set_right('posts')
	elseif self.areanav.set then
		self.areanav:set('right','posts')
	end
				
	if self.areanav.set_rightcss then
		self.areanav:set_rightcss('fa-angle-left font45')
	elseif self.areanav.set then
		self.areanav:set('rightcss','fa-angle-left font45')
	end

	if self.areanav.set_title then
		self.areanav:set_title('人才')
	elseif self.areanav.set then
		self.areanav:set('title','人才')
	end
					
	
	self.mainarea = self.areacirclearea
	
	self:set_style('display:none')

	
end


circleFrame.set_data_id = function(self,data)
	
	if self.areacirclearea.set_data_id then
		self.areacirclearea:set_data_id(data)
	end
				
end


circleFrame.set_data = function(self,data)

	self.data = data
	
	if self.areacirclearea.set_data then
		self.areacirclearea:set_data(data)
	end
			
end





circleFrame.on_show = function(self,key)
	if self.mainarea.on_show then
		self.mainarea:on_show(key)
	end
end


circleFrame.on_hide = function(self,key)
	if self.mainarea.on_hide then
		self.mainarea:on_hide(key)
	end
end


	


	