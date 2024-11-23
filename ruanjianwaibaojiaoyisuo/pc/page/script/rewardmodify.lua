
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

rewardmodifyFrame = inherit(GmBase.FrameBase):name("rewardmodifyFrame")

rewardmodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_rewardmodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- arearewardmodifyarea
	self.arearewardmodifyarea = gm_ruanjianwaibaojiaoyisuo.rewardmodifyareaArea(self)
	
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
			self.areanav:set_title('rewardmodify')
		elseif self.areanav.set then
			self.areanav:set('title','rewardmodify')
		end
					
	
	self.mainarea = self.arearewardmodifyarea
	
	self:set_style('display:none')

	
end


rewardmodifyFrame.set_data_id = function(self,data)
	
	if self.arearewardmodifyarea.set_data_id then
		self.arearewardmodifyarea:set_data_id(data)
	end
				
end


rewardmodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearewardmodifyarea.set_data then
		self.arearewardmodifyarea:set_data(data)
	end
			
end




rewardmodifyFrame.on_show = function(self)
			
	if self.arearewardmodifyarea.on_show then
		self.arearewardmodifyarea:on_show()
	end
			
end


rewardmodifyFrame.on_hide = function(self)
			
	if self.arearewardmodifyarea.on_hide then
		self.arearewardmodifyarea:on_hide()
	end		
			
end

	


	