
gr_module("GmBase")

iconlistArea = inherit(GmCtrl.ControlBase):name("iconlistArea")

iconlistArea.init = function(self,parent,fname)

	local top = self
	self.parent = parent
	
	local fid = fname or "iconlistarea"
	
	GmCtrl.ControlBase.init(self,parent,fid)
	
	self.inititem  = self:get_child('inititem')
	
	self.ctrls = {}
	
	self.frees = {}

end



iconlistArea.clean = function(self)
	for a,b in pairs(self.ctrls) do
		if b.is_init and b:is_init() then
			b:set_visible(false)
			table.insert(self.frees,b)
		end
	end
	self.ctrls = {}
end


iconlistArea.set_column = function(self,col)
	self.column = col
	self.column_width = ( gInfo['screenwidth'] - 20 ) / col - 5
end


iconlistArea.set_data = function(self,re)	
	self:clean()
	local attrs = self:GetAttrs()
	for a,b in GSortedPairs4(re) do
		for aa,bb in pairs(attrs) do
			b[aa] = bb
		end
		local ctrl = self:add_item(b['imgsrc'],b['name'],self.func)
		b.sortid = b.typeid
		b.subject = b.name
		ctrl.data = b
		ctrl.img.data = b
		ctrl.txt.data = b
	end
end


iconlistArea.add_item = function(self,img,txt,func)

	-- print('-------------------------------------------------------------------------------------------------------------------------------------------- iconlistArea.add_item ')

	local top = self
	
	if table.size(self.frees) > 0 then
	
		for a,b in pairs(self.frees) do
			table.insert( self.ctrls , b )
			self.frees[a] = nil
			b:set_style(string.format("display:inline-block;width:%dpx;",self.column_width))
			return b
		end
		
	else
	
		local item = self.inititem:copy()
		
		item.txt = item:get_child('txt')
		item.img = item:get_child('img')
		item.txt:set_inner_text(txt or '')
		
		if img then
			--item.img:set_src(img)
		end
		
		item:set_click(function(ctrl)
				top:on_select(ctrl.data)
			end)
			
		item.img:set_click(function(ctrl)
				top:on_select(ctrl.data)
			end)
			
		item.txt:set_click(function(ctrl)
				top:on_select(ctrl.data)
			end)
				
		table.insert( self.ctrls , item )
		
		item:set_parent(self)
		
		item:set_style(string.format("display:inline-block;width:%dpx;",self.column_width))
		
		return item
	end
	
end
