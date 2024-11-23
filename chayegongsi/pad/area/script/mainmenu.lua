
					
-- D:\GOA\reslibrary\templete\default\pad\area\mainmenu\lua.xsl
gr_module("gm_chayegongsi")

mainmenuArea = inherit(GmCtrl.ControlBase):name("mainmenuArea")

mainmenuArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "mainmenuArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	-- show1
	self.mmfirst2 = self:get_child("mmfirst2")
	self.mmfirst2:set_click(function(link)			
				
		top.hostWindow:showFrame('first2',nil,function(frame)
				
		end)
					  
	end)
	
	-- show1
	self.mmbuyfirst = self:get_child("mmbuyfirst")
	self.mmbuyfirst:set_click(function(link)			
				
		top.hostWindow:showFrame('buyfirst',nil,function(frame)
				
		end)
					  
	end)
	
	-- show1
	self.mmurscenter2 = self:get_child("mmurscenter2")
	self.mmurscenter2:set_click(function(link)			
				
		top.hostWindow:showFrame('urscenter2',nil,function(frame)
				
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
		