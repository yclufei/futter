		
gr_module("gm_minjieyingshi")

TimelineArea = inherit(GmBase.Node):name("TimelineArea")

TimelineArea.init = function (self,parent)

  self.parent = parent
  
  if self.parent then
		GmBase.Node.init_by_parent(self,self.parent, "TimelineArea" )
		self:init_ctrl()
	end
	
end


TimelineArea.init_ctrl = function(self)

	local top = self
	
	self.cursor = self:get_child('cursor')
	self.cursor:set_visible(false)
	
	self.i1 = self:get_child('i1')
	
	self.lineitems = self:get_child('lineitems')
	self.lineitems:set_mousedown(function(ctrl,xx,yy)
	
		top.parent.parent:set_foucus_item(top,nil)
		
		local x,_,_,_ = top:get_scroll_pos()
		local linespos,_ = top.lineitems:get_scroll_pos()
		local xpos = xx-x
			
		if top.on_insert then
		
			local dsize = table.size(self.data)
			local idx,possum = top:calc_pos(xx)
			local marginleft = xx - linespos - possum
			
			top:clean_all_tli()
			
			if dsize == idx then
				
				local tb = {}
				tb['margin'] = marginleft
				tb['width'] = 30
				tb['frequency'] = 1
				self.data[dsize+1] = tb
				top:data_2_ui(top.index,self.data)
				
			else
			
				if self.data[idx+1] then
					self.data[idx+1]['margin'] = self.data[idx+1]['margin'] - marginleft
				end
				
				local newtb = {}
				local newidx = 1
				for a,b in GSortedPairs(self.data) do
					if a - 1 == idx then
					
						local tb = {}
						tb['margin'] = marginleft
						tb['width'] = 30
						tb['frequency'] = 1
						newtb[newidx] = tb
						newidx = newidx + 1
						
					end
					newtb[newidx] = b
					newidx = newidx + 1
				end
				
				top:data_2_ui(top.index,newtb)
			end
		
		else
			top.cursor:set_visible(true)
			local style = string.format('margin-left:%dpx;width:10px;z-index:3;',xpos)
			top.cursor:set_style(style)	
		end
	end)
	
	self.lineitems.childs = {}
	
	self.initlineitem = self:get_child('initlineitem')
	self.initlineitem:set_visible(false)
	
	self.item_mousemove = function(ctrl,a,b,c,d)
		if ctrl.dray then
			local x,y,w,h = ctrl:get_scroll_pos()
			local disx = ctrl.x - a
			top.data[ctrl.idx].margin = top.data[ctrl.idx].margin - disx
			local style = string.format('margin-left:%dpx;width:%dpx',top.data[ctrl.idx].margin,top.data[ctrl.idx].width)
			ctrl:set_style(style,true)			
			top:layout()
		end
		ctrl.x = a
	end
	self.item_mousedown = function(ctrl,a,b,c,d)
		top.parent.parent:set_foucus_item(top,ctrl)
		ctrl.x = a
		ctrl.dray = true
	end
	self.item_mouseup = function(ctrl,a,b,c,d)
		ctrl.x = a
		ctrl.dray = false
	end
	self.item_mouseout = function(ctrl,a,b,c,d)
		ctrl.x = a
		ctrl.dray = false
	end
	
	self.on_insert = false
	
end

	
TimelineArea.set_insert = function (self,bl)
	self.on_insert = bl
end

	
TimelineArea.hide_cursor = function (self)
	self.cursor:set_visible(false)
	self:set_class('tl1')
end


	
TimelineArea.copy = function (self,parent,aid)
	local clonetr = gm_minjieyingshi.TimelineArea()
	clonetr:_copy(self[0])
	clonetr:set_host_window(self.hostWindow[0])
	clonetr.hostWindow = self.hostWindow
	clonetr.parent = self.parent
	clonetr:init_ctrl()
	return clonetr
end


TimelineArea.ui_2_data = function(self)
	return self.index,self.data
end


TimelineArea.data_2_ui = function(self,idx,vtb)
	self.index = idx
	self.data = vtb
	self.i1:set_inner_text(tostring(self.index))
	local size = table.size(vtb)
	for i = 1 , size do
		if self.lineitems.childs[i] == nil then
			self.lineitems.childs[i] = self.initlineitem:copy()
			self.lineitems.childs[i]:set_parent(self.lineitems)
			self.lineitems.childs[i].x = 0
			self.lineitems.childs[i]:set_mousedown(self.item_mousedown)
			self.lineitems.childs[i]:set_mousemove(self.item_mousemove)
			self.lineitems.childs[i]:set_mouseup(self.item_mouseup)
			self.lineitems.childs[i]:set_mouseout(self.item_mouseout)
			self.lineitems.childs[i]:set_step_container(3)
		end
		self.lineitems.childs[i].idx = i
		local style = string.format('display:inline-block;margin-left:%dpx;width:%dpx;',vtb[i]['margin'],vtb[i]['width'])
		self.lineitems.childs[i]:set_style(style,true)
		self.lineitems.childs[i]:set_inner_text(tostring(vtb[i]['frequency']))
	end
	
	for a,b in pairs(self.lineitems.childs) do
		if a > size then
			b:set_visible(false)
			b.idx = -1
		end
	end
	
end

TimelineArea.lineitems_pos = function(self)
	local x,_,_,_ = self:get_scroll_pos()
	local linespos,_ = self.lineitems:get_scroll_pos()
	return linespos-x
end


TimelineArea.max_pos = function(self)
	local pos = 0
	for a,b in pairs(self.data) do
		pos = pos + b.margin + b.width
	end
	return pos
end


TimelineArea.clean_all_tli = function(self)
	for a,b in pairs(self.lineitems.childs) do
		b:set_visible(false)
		b.idx = -1
	end
	self:hide_cursor()
end


TimelineArea.calc_pos = function(self,mpos)
	local posok = true
	local possum = 0
	local newidx = 0
	local linespos,_ = self.lineitems:get_scroll_pos()
	local pos = mpos - linespos
	for a,b in GSortedPairs(self.lineitems.childs) do
		if a > 0 then
			local idx = b.idx
			local itemdata = self.data[idx]
			if itemdata == nil then
				break
			end
			if pos >= possum and pos <= (possum + itemdata.margin + itemdata.width) then
				return newidx,possum
			end 
			possum = possum + itemdata.margin + itemdata.width
			newidx = newidx + 1
		end
	end
	return newidx  , possum
end


