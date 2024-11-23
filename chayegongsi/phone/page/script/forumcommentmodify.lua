
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

forumcommentmodifyFrame = inherit(GmBase.FrameBase):name("forumcommentmodifyFrame")

forumcommentmodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forumcommentmodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaforumcommentmodifyarea
	self.areaforumcommentmodifyarea = gm_chayegongsi.forumcommentmodifyareaArea(self)
	
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
			self.areanav:set_title('forumcommentmodify')
		elseif self.areanav.set then
			self.areanav:set('title','forumcommentmodify')
		end
					
	
	self.mainarea = self.areaforumcommentmodifyarea
	
	self:set_style('display:none')

	
end


forumcommentmodifyFrame.set_data_id = function(self,data)
	
	if self.areaforumcommentmodifyarea.set_data_id then
		self.areaforumcommentmodifyarea:set_data_id(data)
	end
				
end


forumcommentmodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaforumcommentmodifyarea.set_data then
		self.areaforumcommentmodifyarea:set_data(data)
	end
			
end




forumcommentmodifyFrame.on_show = function(self)
			
	if self.areaforumcommentmodifyarea.on_show then
		self.areaforumcommentmodifyarea:on_show()
	end
			
end


forumcommentmodifyFrame.on_hide = function(self)
			
	if self.areaforumcommentmodifyarea.on_hide then
		self.areaforumcommentmodifyarea:on_hide()
	end		
			
end

	


	