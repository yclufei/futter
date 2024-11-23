
					
-- D:\GOA\reslibrary\templete\default\pc\area\mainmenu\lua.xsl
gr_module("gm_xinbanchunzhongyun")

mainmenuArea = inherit(GmCtrl.ControlBase):name("mainmenuArea")

mainmenuArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "mainmenuArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	-- show1
	self.mmmainfirst = self:get_child("mmmainfirst")
	self.mmmainfirst:set_click(function(link)			
				
		top.hostWindow:showFrame('mainfirst',nil,function(frame)
				
		end)
					  
	end)
	
	-- show1
	self.mmmainproduct = self:get_child("mmmainproduct")
	self.mmmainproduct:set_click(function(link)			
				
		top.hostWindow:showFrame('mainproduct',nil,function(frame)
				
		end)
					  
	end)
	
	-- show1
	self.mmmainclient = self:get_child("mmmainclient")
	self.mmmainclient:set_click(function(link)			
				
		top.hostWindow:showFrame('mainclient',nil,function(frame)
				
		end)
					  
	end)
	
	-- show1
	self.mmmainorder = self:get_child("mmmainorder")
	self.mmmainorder:set_click(function(link)			
				
		top.hostWindow:showFrame('mainorder',nil,function(frame)
				
		end)
					  
	end)
	
	-- show1
	self.mmmainformula = self:get_child("mmmainformula")
	self.mmmainformula:set_click(function(link)			
				
		top.hostWindow:showFrame('mainformula',nil,function(frame)
				
		end)
					  
	end)
	
	-- show1
	self.mmmaingallery = self:get_child("mmmaingallery")
	self.mmmaingallery:set_click(function(link)			
				
		top.hostWindow:showFrame('maingallery',nil,function(frame)
				
		end)
					  
	end)
	
	-- show1
	self.mmsystemsetting = self:get_child("mmsystemsetting")
	self.mmsystemsetting:set_click(function(link)			
				
		top.hostWindow:showFrame('systemsetting',nil,function(frame)
				
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
		