
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

myreplyFrame = inherit(GmBase.FrameBase):name("myreplyFrame")

myreplyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_myreply"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areamyreplyarea
	self.areamyreplyarea = gm_ruanjianwaibaojiaoyisuo.myreplyareaArea(self)
	
	if self.areamyreplyarea.set then
				
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
			self.areanav:set_title('我的投标')
		elseif self.areanav.set then
			self.areanav:set('title','我的投标')
		end
					
	
	self.mainarea = self.areamyreplyarea
	
	self:set_style('display:none')

	
end


myreplyFrame.set_data_id = function(self,data)
	
	if self.areamyreplyarea.set_data_id then
		self.areamyreplyarea:set_data_id(data)
	end
				
end


myreplyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areamyreplyarea.set_data then
		self.areamyreplyarea:set_data(data)
	end
			
end




myreplyFrame.on_show = function(self)
			
	if self.areamyreplyarea.on_show then
		self.areamyreplyarea:on_show()
	end
			
end


myreplyFrame.on_hide = function(self)
			
	if self.areamyreplyarea.on_hide then
		self.areamyreplyarea:on_hide()
	end		
			
end

	


	