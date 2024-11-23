
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_chayegongsi")

forumlistFrame = inherit(GmBase.FrameBase):name("forumlistFrame")

forumlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forumlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- areaforumlistarea
	self.areaforumlistarea = gm_chayegongsi.forumlistareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('种植基地')
		elseif self.areanav.set then
			self.areanav:set('title','种植基地')
		end
					
	
	self.mainarea = self.areaforumlistarea
	
	self:set_style('display:none')

	
end


forumlistFrame.set_data_id = function(self,data)
	
	if self.areaforumlistarea.set_data_id then
		self.areaforumlistarea:set_data_id(data)
	end
				
end


forumlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaforumlistarea.set_data then
		self.areaforumlistarea:set_data(data)
	end
			
end




forumlistFrame.on_show = function(self)
			
	if self.areaforumlistarea.on_show then
		self.areaforumlistarea:on_show()
	end
			
end


forumlistFrame.on_hide = function(self)
			
	if self.areaforumlistarea.on_hide then
		self.areaforumlistarea:on_hide()
	end		
			
end

	


	