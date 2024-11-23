
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

formulaaddFrame = inherit(GmBase.FrameBase):name("formulaaddFrame")

formulaaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_formulaadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaformulaaddarea
	self.areaformulaaddarea = gm_xinbanchunzhongyun.formulaaddareaArea(self)
	
	if self.areaformulaaddarea.set then
				
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

	


	