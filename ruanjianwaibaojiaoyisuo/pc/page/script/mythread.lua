
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

mythreadFrame = inherit(GmBase.FrameBase):name("mythreadFrame")

mythreadFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_mythread"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areamythreadarea
	self.areamythreadarea = gm_ruanjianwaibaojiaoyisuo.mythreadareaArea(self)
	
	if self.areamythreadarea.set then
				
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
			self.areanav:set_title('我的项目')
		elseif self.areanav.set then
			self.areanav:set('title','我的项目')
		end
					
	
	self.mainarea = self.areamythreadarea
	
	self:set_style('display:none')

	
end


mythreadFrame.set_data_id = function(self,data)
	
	if self.areamythreadarea.set_data_id then
		self.areamythreadarea:set_data_id(data)
	end
				
end


mythreadFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areamythreadarea.set_data then
		self.areamythreadarea:set_data(data)
	end
			
end




mythreadFrame.on_show = function(self)
			
	if self.areamythreadarea.on_show then
		self.areamythreadarea:on_show()
	end
			
end


mythreadFrame.on_hide = function(self)
			
	if self.areamythreadarea.on_hide then
		self.areamythreadarea:on_hide()
	end		
			
end

	


	