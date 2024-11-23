
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

forumforumlistFrame = inherit(GmBase.FrameBase):name("forumforumlistFrame")

forumforumlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forumforumlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaforumforumlistarea
	self.areaforumforumlistarea = gm_chayegongsi.forumforumlistareaArea(self)
	
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
			self.areanav:set_title('forumforumlist')
		elseif self.areanav.set then
			self.areanav:set('title','forumforumlist')
		end
					
	
	self.mainarea = self.areaforumforumlistarea
	
	self:set_style('display:none')

	
end


forumforumlistFrame.set_data_id = function(self,data)
	
	if self.areaforumforumlistarea.set_data_id then
		self.areaforumforumlistarea:set_data_id(data)
	end
				
end


forumforumlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaforumforumlistarea.set_data then
		self.areaforumforumlistarea:set_data(data)
	end
			
end




forumforumlistFrame.on_show = function(self)
			
	if self.areaforumforumlistarea.on_show then
		self.areaforumforumlistarea:on_show()
	end
			
end


forumforumlistFrame.on_hide = function(self)
			
	if self.areaforumforumlistarea.on_hide then
		self.areaforumforumlistarea:on_hide()
	end		
			
end

	


	