

-- treedelete
gr_module("GmManager")
treedeleteFrame = inherit(GmBase.FrameBase):name("treedeleteFrame")
treedeleteFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"treedeleteFrame")
	--aprint("treedelete")
	
   	
	-- subnav	 
	
	
   
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
  
   	
	-- treedeletecontent	 
	
	
end
  
treedeleteFrame.set_data = function(self,data)
--	print("treedeleteFrame set_data")
--	table.print(data)
end


  
