
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

formulaaddFrame = inherit(GmBase.FrameBase):name("formulaaddFrame")

formulaaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_formulaadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areaformulaaddarea
	self.areaformulaaddarea = gm_xinbanchunzhongyun.formulaaddareaArea(self)
	
	if self.areaformulaaddarea.set then
				
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
			self.areanav:set_title('添加公式')
		elseif self.areanav.set then
			self.areanav:set('title','添加公式')
		end
					
		if self.areaformulaaddarea.set_title then
			self.areaformulaaddarea:set_title('添加公式')
		elseif self.areaformulaaddarea.set then
			self.areaformulaaddarea:set('title','添加公式')
		end
					
	
	self.mainarea = self.areaformulaaddarea
	
	self:set_style('display:none')

	
end


formulaaddFrame.set_data_id = function(self,data)
	
	if self.areaformulaaddarea.set_data_id then
		self.areaformulaaddarea:set_data_id(data)
	end
				
end


formulaaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaformulaaddarea.set_data then
		self.areaformulaaddarea:set_data(data)
	end
			
end




formulaaddFrame.on_show = function(self)
			
	if self.areaformulaaddarea.on_show then
		self.areaformulaaddarea:on_show()
	end
			
end


formulaaddFrame.on_hide = function(self)
			
	if self.areaformulaaddarea.on_hide then
		self.areaformulaaddarea:on_hide()
	end		
			
end

	


	