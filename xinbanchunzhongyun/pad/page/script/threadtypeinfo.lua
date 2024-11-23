
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

threadtypeinfoFrame = inherit(GmBase.FrameBase):name("threadtypeinfoFrame")

threadtypeinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_threadtypeinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areathreadtypeinfoarea
	self.areathreadtypeinfoarea = gm_xinbanchunzhongyun.threadtypeinfoareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('threadtypeinfo')
		elseif self.areanav.set then
			self.areanav:set('title','threadtypeinfo')
		end
					
		if self.areathreadtypeinfoarea.set_title then
			self.areathreadtypeinfoarea:set_title('threadtypeinfo')
		elseif self.areathreadtypeinfoarea.set then
			self.areathreadtypeinfoarea:set('title','threadtypeinfo')
		end
					
	
	self.mainarea = self.areathreadtypeinfoarea
	
	self:set_style('display:none')

	
end


threadtypeinfoFrame.set_data_id = function(self,data)
	
	if self.areathreadtypeinfoarea.set_data_id then
		self.areathreadtypeinfoarea:set_data_id(data)
	end
				
end


threadtypeinfoFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areathreadtypeinfoarea.set_data then
		self.areathreadtypeinfoarea:set_data(data)
	end
			
end




threadtypeinfoFrame.on_show = function(self)
			
	if self.areathreadtypeinfoarea.on_show then
		self.areathreadtypeinfoarea:on_show()
	end
			
end


threadtypeinfoFrame.on_hide = function(self)
			
	if self.areathreadtypeinfoarea.on_hide then
		self.areathreadtypeinfoarea:on_hide()
	end		
			
end

	


	