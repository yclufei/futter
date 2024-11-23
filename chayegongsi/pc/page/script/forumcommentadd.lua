
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

forumcommentaddFrame = inherit(GmBase.FrameBase):name("forumcommentaddFrame")

forumcommentaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forumcommentadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaforumcommentaddarea
	self.areaforumcommentaddarea = gm_chayegongsi.forumcommentaddareaArea(self)
	
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
			self.areanav:set_title('forumcommentadd')
		elseif self.areanav.set then
			self.areanav:set('title','forumcommentadd')
		end
					
	
	self.mainarea = self.areaforumcommentaddarea
	
	self:set_style('display:none')

	
end


forumcommentaddFrame.set_data_id = function(self,data)
	
	if self.areaforumcommentaddarea.set_data_id then
		self.areaforumcommentaddarea:set_data_id(data)
	end
				
end


forumcommentaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaforumcommentaddarea.set_data then
		self.areaforumcommentaddarea:set_data(data)
	end
			
end




forumcommentaddFrame.on_show = function(self)
			
	if self.areaforumcommentaddarea.on_show then
		self.areaforumcommentaddarea:on_show()
	end
			
end


forumcommentaddFrame.on_hide = function(self)
			
	if self.areaforumcommentaddarea.on_hide then
		self.areaforumcommentaddarea:on_hide()
	end		
			
end

	


	