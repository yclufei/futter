
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

formulamodifyFrame = inherit(GmBase.FrameBase):name("formulamodifyFrame")

formulamodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_formulamodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaformulamodifyarea
	self.areaformulamodifyarea = gm_xinbanchunzhongyun.formulamodifyareaArea(self)
	
	if self.areaformulamodifyarea.set then
				
	end
	
		if self.areaformulamodifyarea.set_title then
			self.areaformulamodifyarea:set_title('编辑公式')
		elseif self.areaformulamodifyarea.set then
			self.areaformulamodifyarea:set('title','编辑公式')
		end
					 
    	self.frameBg = self:get_child('frameBg')
    	self.frameBg:set_click(function(bg)
    		top.hostWindow:delTopNavFrame()
    	end)
    
	
	self.mainarea = self.areaformulamodifyarea
	
	self:set_style('display:none')

	
end


formulamodifyFrame.set_data_id = function(self,data)
	
	if self.areaformulamodifyarea.set_data_id then
		self.areaformulamodifyarea:set_data_id(data)
	end
				
end


formulamodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaformulamodifyarea.set_data then
		self.areaformulamodifyarea:set_data(data)
	end
			
end




formulamodifyFrame.on_show = function(self)
			
	if self.areaformulamodifyarea.on_show then
		self.areaformulamodifyarea:on_show()
	end
			
end


formulamodifyFrame.on_hide = function(self)
			
	if self.areaformulamodifyarea.on_hide then
		self.areaformulamodifyarea:on_hide()
	end		
			
end

	


	