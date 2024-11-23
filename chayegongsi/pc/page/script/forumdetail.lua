
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_chayegongsi")

forumdetailFrame = inherit(GmBase.FrameBase):name("forumdetailFrame")

forumdetailFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forumdetail"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaforumdetailarea
	self.areaforumdetailarea = gm_chayegongsi.forumdetailareaArea(self)
	
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
			self.areanav:set_title('特色茶叶详情')
		elseif self.areanav.set then
			self.areanav:set('title','特色茶叶详情')
		end
					
	
	self.mainarea = self.areaforumdetailarea
	
	self:set_style('display:none')

	
end


forumdetailFrame.set_data_id = function(self,data)
	
	if self.areaforumdetailarea.set_data_id then
		self.areaforumdetailarea:set_data_id(data)
	end
				
end


forumdetailFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaforumdetailarea.set_data then
		self.areaforumdetailarea:set_data(data)
	end
			
end




forumdetailFrame.on_show = function(self)
			
	if self.areaforumdetailarea.on_show then
		self.areaforumdetailarea:on_show()
	end
			
end


forumdetailFrame.on_hide = function(self)
			
	if self.areaforumdetailarea.on_hide then
		self.areaforumdetailarea:on_hide()
	end		
			
end

	


	