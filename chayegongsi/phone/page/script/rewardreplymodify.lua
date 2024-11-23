
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_chayegongsi")

rewardreplymodifyFrame = inherit(GmBase.FrameBase):name("rewardreplymodifyFrame")

rewardreplymodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_rewardreplymodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_chayegongsi.navArea(self)
	
	-- arearewardreplymodifyarea
	self.arearewardreplymodifyarea = gm_chayegongsi.rewardreplymodifyareaArea(self)
	
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
			self.areanav:set_title('rewardreplymodify')
		elseif self.areanav.set then
			self.areanav:set('title','rewardreplymodify')
		end
					
	
	self.mainarea = self.arearewardreplymodifyarea
	
	self:set_style('display:none')

	
end


rewardreplymodifyFrame.set_data_id = function(self,data)
	
	if self.arearewardreplymodifyarea.set_data_id then
		self.arearewardreplymodifyarea:set_data_id(data)
	end
				
end


rewardreplymodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearewardreplymodifyarea.set_data then
		self.arearewardreplymodifyarea:set_data(data)
	end
			
end




rewardreplymodifyFrame.on_show = function(self)
			
	if self.arearewardreplymodifyarea.on_show then
		self.arearewardreplymodifyarea:on_show()
	end
			
end


rewardreplymodifyFrame.on_hide = function(self)
			
	if self.arearewardreplymodifyarea.on_hide then
		self.arearewardreplymodifyarea:on_hide()
	end		
			
end

	


	