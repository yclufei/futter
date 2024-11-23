
					
-- D:\GOA\reslibrary\templete\default\phone\area\mainmenu\lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

mainmenuArea = inherit(GmCtrl.ControlBase):name("mainmenuArea")

mainmenuArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "mainmenuArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	-- show1
	self.mmfirst = self:get_child("mmfirst")
	self.mmfirst:set_click(function(link)			
				
		top.hostWindow:showFrame('first',nil,function(frame)
				
		end)
					  
	end)
	
	-- show1
	self.mmproject = self:get_child("mmproject")
	self.mmproject:set_click(function(link)			
				
		top.hostWindow:showFrame('project',nil,function(frame)
				
		end)
					  
	end)
	
	-- show1
	self.mmcircle = self:get_child("mmcircle")
	self.mmcircle:set_click(function(link)			
				
		top.hostWindow:showFrame('circle',nil,function(frame)
				
		end)
					  
	end)
	
	-- show1
	self.mmdiscover = self:get_child("mmdiscover")
	self.mmdiscover:set_click(function(link)							
		top.hostWindow:showFrame('discover',nil,function(frame)				
		end)					  
	end)
	
	-- show1
	self.mmurscenter = self:get_child("mmurscenter")
	self.mmurscenter:set_click(function(link)							
		top.hostWindow:showFrame('urscenter',nil,function(frame)				
		end)					  
	end)
	
	self.items = {}
	self.items[1] = self.mmfirst
	self.items[2] = self.mmproject
	self.items[3] = self.mmcircle
	self.items[4] = self.mmdiscover
	self.items[5] = self.mmurscenter
	
end

mainmenuArea.set_index = function(self,idx)
	self.items[idx]:set_class('mainMenuItem5_select divcenter fa fa'..tostring(idx)..' font40')
end
