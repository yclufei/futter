
					
-- D:\GOA\reslibrary\templete\default\phone\area\mainmenu\lua.xsl
gr_module("gm_minjieyingshi")

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
	
end

mainmenuArea.set___projectalias = function(self,value)
	self.__projectalias = value
end
		
mainmenuArea.set___update = function(self,value)
	self.__update = value
end
		
mainmenuArea.set___version = function(self,value)
	self.__version = value
end
		