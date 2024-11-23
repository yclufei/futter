
					
-- D:\GOA\reslibrary\templete\default\phone\area\mainmenu\lua.xsl
gr_module("gm_xinbanchunzhongyun")

mainmenuArea = inherit(GmCtrl.ControlBase):name("mainmenuArea")

mainmenuArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "mainmenuArea"
	GmCtrl.ControlBase.init(self,parent,fid )


   		

	self.mmmainfirst = self:get_child("mmmainfirst")
	self.mmmainfirst:set_click(function(link)			

		top.hostWindow:showFrame('mainfirst',nil,function(frame)
		end)
			
		top:clickfunc()
			
	end)
		
	 		

	self.mmmainproduct = self:get_child("mmmainproduct")
	self.mmmainproduct:set_click(function(link)			

		top.hostWindow:showFrame('mainproduct',nil,function(frame)
		end)
			
		top:clickfunc()
			
	end)
		
	 		

	self.mmmainclient = self:get_child("mmmainclient")
	self.mmmainclient:set_click(function(link)			

		top.hostWindow:showFrame('mainclient',nil,function(frame)
		end)
			
		top:clickfunc()
			
	end)
		
	 		

	self.mmmainorder = self:get_child("mmmainorder")
	self.mmmainorder:set_click(function(link)			

		top.hostWindow:showFrame('mainorder',nil,function(frame)
		end)
			
		top:clickfunc()
			
	end)
		
	 		

	self.mmmainformula = self:get_child("mmmainformula")
	self.mmmainformula:set_click(function(link)			

		top.hostWindow:showFrame('mainformula',nil,function(frame)
		end)
			
		top:clickfunc()
			
	end)
		
	 		

	self.mmmaingallery = self:get_child("mmmaingallery")
	self.mmmaingallery:set_click(function(link)			

		top.hostWindow:showFrame('maingallery',nil,function(frame)
		end)
			
		top:clickfunc()
			
	end)
		
	 		

	self.mmsystemsetting = self:get_child("mmsystemsetting")
	self.mmsystemsetting:set_click(function(link)			

		top.hostWindow:showFrame('systemsetting',nil,function(frame)
		end)
			
		top:clickfunc()
			
	end)
		
	
	
	
	self.items = self:get_child('items')
	self.pop = self:get_child('pop')
	
	self.show = false
	
	self.clickfunc = function(self)
		if top.show then
			top.pop:set_visible(false)
		else
			top.pop:set_visible(true)
		end
		top.show = not top.show	
		top:updatetick(true)
	end
	
	self:set_click(self.clickfunc)
	self.pop:set_click(self.clickfunc)
	self.items:set_click(self.clickfunc)
	
	
	
    
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
		