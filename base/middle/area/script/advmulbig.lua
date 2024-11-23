
gr_module("GmBase")

advmulBigArea = inherit(GmCtrl.ControlBase):name("advmulBigArea")

advmulBigArea.init = function(self,parent,fname)

	local top = self
	self.parent = parent
	
	local fid = fname or "advmulbigarea"
	GmCtrl.ControlBase.init(self,parent,fid)
	
	self.scrollcontainer = self:get_child("scrolllist2")
	self.scrollcontent = self:get_child("scrollcontent")
	self.scrollitem = self:get_child("scrollitem")
	
	
	self.scrollcontainer:set_step_container(1)
	
	
	
	
	
	self.scrollcontainer:set_mousedown( function(self)
												--print("set_mousedown")
												--top:remove_timeout()
												--self:remove_timeout()
											end)
	self.scrollcontainer:set_mouseup( 	function(self)
												--print("set_mouseup")
												top:set_timeout(1)
											end)
	
	self.scrollcontainer.on_step = function(self,s)
		local w,h,x,y = self:get_scroll_pos()
		--print("advmulBigArea on_step",s+1,w,h,x,y)
		if x + 512 + 215 > w then
			self:set_scroll_pos( 110 * gInfo['retina'],-1,true)
			top.step = 1		
		else
			top.step = s + 1
		end		
		top:set_timeout(1)
	end
	
	self.scrollcontainer.on_timeout = function(self)
		local w,h,x,y = self:get_scroll_pos()
		self:set_scroll_pos(x + 50,-1,true)
		if ( x - 110 ) % 512 < 470 then
			if x + 512 + 115 > w then
				self:set_scroll_pos( 110 + 50,-1,true) -- 因为上面已经开始移动了50，所以这里也要移动多 50
				top.step = 1				
			end
			self:set_timeout(70)
		else
			self:set_scroll_pos(top.step * 512 + 110,-1,true)
			top.step = top.step + 1
			top:set_timeout(100)
		end
	end
	
	self.step = 1
	
end


advmulBigArea.on_timeout = function(self)
	--print("advmulBigArea on_timeout")
	--self:remove_timeout()
	self.scrollcontainer:set_timeout(5)
end

advmulBigArea.init_pos = function(self)
	self.scrollcontainer:set_scroll_pos(110 * gInfo['retina'],-1,true)
end


advmulBigArea.additem = function(self,data)
	local itemctrl = self.scrollitem:copy()
	itemctrl:set_visible(true)
	itemctrl:set_inner_text(tostring(data['parentoid']).." | "..data['objecttitle'])
	if data['attr']['imgsrc'] then
		local imgsrc = "background-image:url("..data['attr']['imgsrc']['attrvalue']..")"
		--print(imgsrc)
		itemctrl:set_style(imgsrc)
	end
	local c = self.scrollcontent:add_ctrl(data['id'],itemctrl)
	local s = "width:"..tostring(c).."00%%"
	self.scrollcontent:set_style(s)
end


advmulBigArea.set_data = function(self,data,aa)
	local len = table.size(data['object'])
	local firstdata = nil
	for a,b in pairs(data['object']) do
		if firstdata == nil then
			firstdata = b
		end
		self:additem(b)
	end
	if firstdata then
		firstdata['id'] = 'first'
		self:additem(firstdata)
	end
	self:init_pos()	
	self:set_timeout(1)
	self:updatetick()
end
