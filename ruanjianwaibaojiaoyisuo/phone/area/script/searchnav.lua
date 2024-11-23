
					
-- default searchnav
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

searchnavArea = inherit(GmCtrl.ControlBase):name("searchnavArea")

searchnavArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "searchnavArea"
	GmCtrl.ControlBase.init(self,parent,fid )
	
	
	


	self.param = {}
	
	self.lefttd = self:get_child('left')
	self.righttd = self:get_child('right')
	
	


		
	self.param['right']  = function(top,value)
		top.righttd:set_style("display:table-col")
		top.right = value
	end
	self.param['rightcss']  = function(top,value)
		top.nvright:set_class('divcenter '..value)
	end
	
	self.rightfunc = function(link)
		if top.right == 'back' then
			top.hostWindow:delTopNavFrame()		
		elseif top.right == 'upop' then
			top.hostWindow:uppopFrame()
		else
			--top.hostWindow:addNavFrame(top.right)
			top.hostWindow:exec_action(link ,top.right, top)
		end
	end
	
	self.nvright = self:get_child("nvright")
	self.nvright:set_click(function(link)	top.rightfunc(link) end)
	
	
	
	
		
	self.param['left'] = function(top,value)
		top.lefttd:set_style("display:table-col")
		top.left = value
	end
	self.param['leftcss']  = function(top,value)
		top.nvleft:set_class('divcenter '..value)
	end
	
	self.leftfunc = function(link)
		if top.left == 'back' then
			top.hostWindow:delTopNavFrame()	
		elseif top.left == 'upop' then
			top.hostWindow:uppopFrame()
		else
			top.hostWindow:addNavFrame(top.left)
		end
	end
	
	self.nvleft = self:get_child("nvleft")
	self.nvleft:set_click(function(link) top.leftfunc(link) end)
	


	self.iptsearch = self:get_child('iptsearch')
	self.iptsearch:set_contextmenu(function(link) 
		self.hostWindow:exec_action(link ,'search', top)
	end)

	

	
end



searchnavArea.set = function(self,key,value)
	if self.param[key] then
		self.param[key](self,value)
	end
end
	
	
	