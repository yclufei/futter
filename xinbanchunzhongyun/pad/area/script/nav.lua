
					
-- D:\GOA\reslibrary\templete\default\pad\area\nav\lua.xsl	
gr_module("gm_xinbanchunzhongyun")

navArea = inherit(GmCtrl.ControlBase):name("navArea")

navArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "navArea"
	GmCtrl.ControlBase.init(self,parent,fid )
	

	self.param = {}
	self.param['title'] = function(top,value)
		top.title = value
		top.nvtxt:set_inner_text(value)
	end
	self.param['left'] = function(top,value)
		top.left = value
	end
	self.param['right']  = function(top,value)
		top.right = value
	end
	self.param['leftcss']  = function(top,value)
		top.nvleft:set_class(value..' NavTDWidth centerbg padding14 floatL')
	end
	self.param['rightcss']  = function(top,value)
		top.nvright:set_class(value..' padding14 NavTDWidth floatR')
	end


	self.rightfunc = function(link)
		if top.right == 'back' then
			top.hostWindow:delTopNavFrame()		
		elseif top.right == 'upop' then
			top.hostWindow:uppopFrame()
		else
			top.hostWindow:addNavFrame(top.right)
		end
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
		
	self.title = nil
		
	-- go2
	self.nvright = self:get_child("nvright")
	self.nvright:set_click(function(link)	top.rightfunc(link) end)
	
	-- go2
	self.nvleft = self:get_child("nvleft")
	self.nvleft:set_click(function(link) top.leftfunc(link) end)
	
	self.nvtxt = self:get_child("nvtxt")
	

end

	
	
navArea.set = function(self,key,value)
	if self.param[key] then
		self.param[key](self,value)
	end
end
	

	