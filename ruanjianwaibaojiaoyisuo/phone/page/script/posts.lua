
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

postsFrame = inherit(GmBase.FrameBase):name("postsFrame")

postsFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_posts"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areapostsarea
	self.areapostsarea = gm_ruanjianwaibaojiaoyisuo.postsareaArea(self)
	
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
					
		if self.areanav.set_right then
			self.areanav:set_right('upop')
		elseif self.areanav.set then
			self.areanav:set('right','upop')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('发 布')
		elseif self.areanav.set then
			self.areanav:set('title','发 布')
		end
					
	
	self.mainarea = self.areapostsarea
	
	self:set_style('display:none')

	
end


postsFrame.set_data_id = function(self,data)
	
	if self.areapostsarea.set_data_id then
		self.areapostsarea:set_data_id(data)
	end
				
end


postsFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areapostsarea.set_data then
		self.areapostsarea:set_data(data)
	end
			
end




postsFrame.on_show = function(self)
			
	if self.areapostsarea.on_show then
		self.areapostsarea:on_show()
	end
			
end


postsFrame.on_hide = function(self)
			
	if self.areapostsarea.on_hide then
		self.areapostsarea:on_hide()
	end		
			
end

	


	