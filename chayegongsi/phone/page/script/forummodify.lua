
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

forummodifyFrame = inherit(GmBase.FrameBase):name("forummodifyFrame")

forummodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forummodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaforummodifyarea
	self.areaforummodifyarea = gm_chayegongsi.forummodifyareaArea(self)
	
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
			self.areanav:set_title('forummodify')
		elseif self.areanav.set then
			self.areanav:set('title','forummodify')
		end
					
	
	self.mainarea = self.areaforummodifyarea
	
	self:set_style('display:none')

	
end


forummodifyFrame.set_data_id = function(self,data)
	
	if self.areaforummodifyarea.set_data_id then
		self.areaforummodifyarea:set_data_id(data)
	end
				
end


forummodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaforummodifyarea.set_data then
		self.areaforummodifyarea:set_data(data)
	end
			
end




forummodifyFrame.on_show = function(self)
			
	if self.areaforummodifyarea.on_show then
		self.areaforummodifyarea:on_show()
	end
			
end


forummodifyFrame.on_hide = function(self)
			
	if self.areaforummodifyarea.on_hide then
		self.areaforummodifyarea:on_hide()
	end		
			
end

	


	