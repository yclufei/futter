
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

formulatypemodifyFrame = inherit(GmBase.FrameBase):name("formulatypemodifyFrame")

formulatypemodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_formulatypemodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaformulatypemodifyarea
	self.areaformulatypemodifyarea = gm_xinbanchunzhongyun.formulatypemodifyareaArea(self)
	
	if self.areaformulatypemodifyarea.set then
				
	end
	
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
			self.areanav:set_title('公式分类编辑')
		elseif self.areanav.set then
			self.areanav:set('title','公式分类编辑')
		end
					
		if self.areaformulatypemodifyarea.set_title then
			self.areaformulatypemodifyarea:set_title('公式分类编辑')
		elseif self.areaformulatypemodifyarea.set then
			self.areaformulatypemodifyarea:set('title','公式分类编辑')
		end
					
	
	self.mainarea = self.areaformulatypemodifyarea
	
	self:set_style('display:none')

	
end


formulatypemodifyFrame.set_data_id = function(self,data)
	
	if self.areaformulatypemodifyarea.set_data_id then
		self.areaformulatypemodifyarea:set_data_id(data)
	end
				
end


formulatypemodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaformulatypemodifyarea.set_data then
		self.areaformulatypemodifyarea:set_data(data)
	end
			
end




formulatypemodifyFrame.on_show = function(self)
			
	if self.areaformulatypemodifyarea.on_show then
		self.areaformulatypemodifyarea:on_show()
	end
			
end


formulatypemodifyFrame.on_hide = function(self)
			
	if self.areaformulatypemodifyarea.on_hide then
		self.areaformulatypemodifyarea:on_hide()
	end		
			
end

	


	