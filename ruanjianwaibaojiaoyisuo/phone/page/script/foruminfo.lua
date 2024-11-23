
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

foruminfoFrame = inherit(GmBase.FrameBase):name("foruminfoFrame")

foruminfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_foruminfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- mainarea
	self.mainarea = gm_ruanjianwaibaojiaoyisuo.foruminfoareaArea(self)

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
		self.areanav:set_title('发现详情')
	elseif self.areanav.set then
		self.areanav:set('title','发现详情')
	end
					
	
	self:set_style('display:none')

	
end


foruminfoFrame.set_data_id = function(self,data)
	
	if self.mainarea.set_data_id then
		self.mainarea:set_data_id(data)
	end
				
end


foruminfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.mainarea.set_data then
		self.mainarea:set_data(data)
	end
			
end




foruminfoFrame.on_show = function(self,key)
			
	if self.mainarea.on_show then
		self.mainarea:on_show(key)
	end
			
end


foruminfoFrame.on_hide = function(self,key)
			
	if self.mainarea.on_hide then
		self.mainarea:on_hide(key)
	end		
			
end

	


	