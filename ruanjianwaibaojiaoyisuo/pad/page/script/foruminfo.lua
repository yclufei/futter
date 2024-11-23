
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

foruminfoFrame = inherit(GmBase.FrameBase):name("foruminfoFrame")

foruminfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_foruminfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areaforuminfoarea
	self.areaforuminfoarea = gm_ruanjianwaibaojiaoyisuo.foruminfoareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('发现详情')
		elseif self.areanav.set then
			self.areanav:set('title','发现详情')
		end
					
	
	self.mainarea = self.areaforuminfoarea
	
	self:set_style('display:none')

	
end


foruminfoFrame.set_data_id = function(self,data)
	
	if self.areaforuminfoarea.set_data_id then
		self.areaforuminfoarea:set_data_id(data)
	end
				
end


foruminfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaforuminfoarea.set_data then
		self.areaforuminfoarea:set_data(data)
	end
			
end




foruminfoFrame.on_show = function(self)
			
	if self.areaforuminfoarea.on_show then
		self.areaforuminfoarea:on_show()
	end
			
end


foruminfoFrame.on_hide = function(self)
			
	if self.areaforuminfoarea.on_hide then
		self.areaforuminfoarea:on_hide()
	end		
			
end

	


	