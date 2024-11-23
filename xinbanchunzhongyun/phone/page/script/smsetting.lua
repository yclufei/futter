
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

smsettingFrame = inherit(GmBase.FrameBase):name("smsettingFrame")

smsettingFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_smsetting"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areasmsettingarea
	self.areasmsettingarea = gm_xinbanchunzhongyun.smsettingareaArea(self)
	
	if self.areasmsettingarea.set then
				
	end
	
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
			self.areanav:set_title('短信设置')
		elseif self.areanav.set then
			self.areanav:set('title','短信设置')
		end
					
		if self.areasmsettingarea.set_title then
			self.areasmsettingarea:set_title('短信设置')
		elseif self.areasmsettingarea.set then
			self.areasmsettingarea:set('title','短信设置')
		end
					
	
	self.mainarea = self.areasmsettingarea
	
	self:set_style('display:none')

	
end


smsettingFrame.set_data_id = function(self,data)
	
	if self.areasmsettingarea.set_data_id then
		self.areasmsettingarea:set_data_id(data)
	end
				
end


smsettingFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areasmsettingarea.set_data then
		self.areasmsettingarea:set_data(data)
	end
			
end




smsettingFrame.on_show = function(self)
			
	if self.areasmsettingarea.on_show then
		self.areasmsettingarea:on_show()
	end
			
end


smsettingFrame.on_hide = function(self)
			
	if self.areasmsettingarea.on_hide then
		self.areasmsettingarea:on_hide()
	end		
			
end

	


	