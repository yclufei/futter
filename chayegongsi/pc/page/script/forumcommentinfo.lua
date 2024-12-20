
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

forumcommentinfoFrame = inherit(GmBase.FrameBase):name("forumcommentinfoFrame")

forumcommentinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forumcommentinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaforumcommentinfoarea
	self.areaforumcommentinfoarea = gm_chayegongsi.forumcommentinfoareaArea(self)
	
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
			self.areanav:set_title('forumcommentinfo')
		elseif self.areanav.set then
			self.areanav:set('title','forumcommentinfo')
		end
					
	
	self.mainarea = self.areaforumcommentinfoarea
	
	self:set_style('display:none')

	
end


forumcommentinfoFrame.set_data_id = function(self,data)
	
	if self.areaforumcommentinfoarea.set_data_id then
		self.areaforumcommentinfoarea:set_data_id(data)
	end
				
end


forumcommentinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaforumcommentinfoarea.set_data then
		self.areaforumcommentinfoarea:set_data(data)
	end
			
end




forumcommentinfoFrame.on_show = function(self)
			
	if self.areaforumcommentinfoarea.on_show then
		self.areaforumcommentinfoarea:on_show()
	end
			
end


forumcommentinfoFrame.on_hide = function(self)
			
	if self.areaforumcommentinfoarea.on_hide then
		self.areaforumcommentinfoarea:on_hide()
	end		
			
end

	


	