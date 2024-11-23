
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

threadtypemodifyFrame = inherit(GmBase.FrameBase):name("threadtypemodifyFrame")

threadtypemodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_threadtypemodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areathreadtypemodifyarea
	self.areathreadtypemodifyarea = gm_xinbanchunzhongyun.threadtypemodifyareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('threadtypemodify')
		elseif self.areanav.set then
			self.areanav:set('title','threadtypemodify')
		end
					
		if self.areathreadtypemodifyarea.set_title then
			self.areathreadtypemodifyarea:set_title('threadtypemodify')
		elseif self.areathreadtypemodifyarea.set then
			self.areathreadtypemodifyarea:set('title','threadtypemodify')
		end
					
	
	self.mainarea = self.areathreadtypemodifyarea
	
	self:set_style('display:none')

	
end


threadtypemodifyFrame.set_data_id = function(self,data)
	
	if self.areathreadtypemodifyarea.set_data_id then
		self.areathreadtypemodifyarea:set_data_id(data)
	end
				
end


threadtypemodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areathreadtypemodifyarea.set_data then
		self.areathreadtypemodifyarea:set_data(data)
	end
			
end




threadtypemodifyFrame.on_show = function(self)
			
	if self.areathreadtypemodifyarea.on_show then
		self.areathreadtypemodifyarea:on_show()
	end
			
end


threadtypemodifyFrame.on_hide = function(self)
			
	if self.areathreadtypemodifyarea.on_hide then
		self.areathreadtypemodifyarea:on_hide()
	end		
			
end

	


	