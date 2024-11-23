
					
-- D:\GOA\reslibrary\templete\default\pc\area\mainmenu\lua.xsl
gr_module("gm_minjieyingshi")

mainmenuArea = inherit(GmCtrl.ControlBase):name("mainmenuArea")

mainmenuArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "mainmenuArea"
	GmCtrl.ControlBase.init(self,parent,fid )
	
	-- show1
	self.mmfirst = self:get_child("mmfirst")
	self.mmfirst:set_click(function(link)			
				
		top.hostWindow:showFrame('first',nil,function(frame) end)
					  
	end)
	
	-- show1
	self.mmdiscover = self:get_child("mmdiscover")
	self.mmdiscover:set_click(function(link)			
				
		top.hostWindow:showFrame('discover',nil,function(frame) end)
					  
	end)
	
	-- show1
	self.mmurscenter = self:get_child("mmurscenter")
	self.mmurscenter:set_click(function(link)			
				
		top.hostWindow:showFrame('urscenter',nil,function(frame) end)
					  
	end)
	
	self.mmrecommend = self:get_child("mmrecommend")
	self.mmrecommend:set_click(function(link)
		top.hostWindow:showFrame('recommend',nil,function(frame) end)
	end)
	 
	self.mmvideolist = self:get_child("mmvideolist") 
	self.mmvideolist:set_click(function(link)
		 top.hostWindow:showFrame('videolist',nil,function(frame) end)
	end)
	
	self.mmsortlist = self:get_child("mmsortlist")
	self.mmsortlist:set_click(function(link)
		 top.hostWindow:showFrame('sortlist',nil,function(frame) end)
	end)
	

	self.mmlocal = self:get_child("mmlocal")
	self.mmlocal:set_click(function(link)
		 top.hostWindow:showFrame('local',nil,function(frame) end)
	end)
	
	self.mmlike = self:get_child("mmlike")
	self.mmlike:set_click(function(link)
		 top.hostWindow:showFrame('like',nil,function(frame) end)
	end)
	
		
	self.mmhistory = self:get_child("mmhistory")
	self.mmhistory:set_click(function(link)
		 top.hostWindow:showFrame('history',nil,function(frame) end)
	end)
	
	self.mmfavorite = self:get_child("mmfavorite")
	self.mmfavorite:set_click(function(link)
		 top.hostWindow:showFrame('favorite',nil,function(frame) end)
	end)

	


	
end

