
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

rewardinfoFrame = inherit(GmBase.FrameBase):name("rewardinfoFrame")

rewardinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_rewardinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- arearewardinfoarea
	self.arearewardinfoarea = gm_ruanjianwaibaojiaoyisuo.rewardinfoareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('内容')
		elseif self.areanav.set then
			self.areanav:set('title','内容')
		end
					
	
	self.mainarea = self.arearewardinfoarea
	
	self:set_style('display:none')

	
end


rewardinfoFrame.set_data_id = function(self,data)
	
	if self.arearewardinfoarea.set_data_id then
		self.arearewardinfoarea:set_data_id(data)
	end
				
end


rewardinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearewardinfoarea.set_data then
		self.arearewardinfoarea:set_data(data)
	end
			
end




rewardinfoFrame.on_show = function(self)
			
	if self.arearewardinfoarea.on_show then
		self.arearewardinfoarea:on_show()
	end
			
end


rewardinfoFrame.on_hide = function(self)
			
	if self.arearewardinfoarea.on_hide then
		self.arearewardinfoarea:on_hide()
	end		
			
end

	


	