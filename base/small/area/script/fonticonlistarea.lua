
gr_module("GmBase")

fonticonlistArea = inherit(GmCtrl.ControlBase):name("fonticonlistArea")

fonticonlistArea.init = function(self,parent,fname)

	local top = self
	self.parent = parent
	
	local fid = fname or "fonticonlistarea"
	
	GmCtrl.ControlBase.init(self,parent,fid)
	
	self.inititem  = self:get_child('fonticoninititem')
	
	self.ctrls = {}

end



fonticonlistArea.clean = function(self)
	for a,b in pairs(self.ctrls) do
		if b.is_init and b:is_init() then
			b:set_visible(false)
			b:releaseRef()
		end
	end
	self.ctrls = {}
end



fonticonlistArea.set_column = function(self,col)
	self.column = col
	self.column_width = gInfo['screenwidth'] / col - col
end



fonticonlistArea.set_data = function(self,re)
	for a,b in GSortedPairs4(re) do
		local ctrl = self:add_item(b,self.func)
		ctrl.data = b
		ctrl.txt.data = b
	end
end



fonticonlistArea.add_item = function(self,data,func)
	local top = self
	
	local typeid = data['typeid']
	
	local item = self.ctrls[typeid]
	
	if item == nil then
	
		item = self.inititem:copy()
		
		item.txt = item:get_child('fitxt')
		
		item.ficon = item:get_child('ficon')
		
		item:set_click(function(ctrl)
				top:on_select(ctrl.data)
			end)
			
		item.txt:set_click(function(ctrl)
				top:on_select(ctrl.data)
			end)
				
		item:set_parent(self)
		item:set_style(string.format("width:%dpx;",self.column_width))
		
		self.ctrls[typeid] = item
	
	end
	
	
	if data['description'] then
		item.ficon:set_class('fa colorMain '..(data['description'] or 'fa1'))
	end
	
	item.txt:set_inner_text(data['name'] or '')
	
	return item
end
