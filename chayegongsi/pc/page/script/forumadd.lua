
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

forumaddFrame = inherit(GmBase.FrameBase):name("forumaddFrame")

forumaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forumadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaforumaddarea
	self.areaforumaddarea = gm_chayegongsi.forumaddareaArea(self)
	
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
			self.areanav:set_title('基地录入')
		elseif self.areanav.set then
			self.areanav:set('title','基地录入')
		end
					
	
	self.mainarea = self.areaforumaddarea
	
	self:set_style('display:none')

	
end


forumaddFrame.set_data_id = function(self,data)
	
	if self.areaforumaddarea.set_data_id then
		self.areaforumaddarea:set_data_id(data)
	end
				
end


forumaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaforumaddarea.set_data then
		self.areaforumaddarea:set_data(data)
	end
			
end




forumaddFrame.on_show = function(self)
			
	if self.areaforumaddarea.on_show then
		self.areaforumaddarea:on_show()
	end
			
end


forumaddFrame.on_hide = function(self)
			
	if self.areaforumaddarea.on_hide then
		self.areaforumaddarea:on_hide()
	end		
			
end

	


	