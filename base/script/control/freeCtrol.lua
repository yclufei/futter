
gr_module("GmCtrl")

freeCtrolCtrl = inherit():name("freeCtrolCtrl")

freeCtrolCtrl.init = function(self,parent,initid)

	local top = self
	self.parent = parent

	self.inititem  = self.parent:get_child(initid)
	
	self.items = {}
	self.frees = {}

end


freeCtrolCtrl.new_item = function(self,id)
	if table.size(self.frees) > 0 then
		if self.frees[id] then
			self.items[id] = self.frees[id]
			self.frees[id] = nil
		else
			for a,b in pairs(self.frees) do
				self.items[id] = b
				self.frees[a] = nil
				break
			end
		end
	else
		self.items[id] = self.inititem:copy()
	end
	if self.items[id] then
		self.items[id]:set_attr('id',id)
	end
	self.items[id]:set_parent(self.parent)
	self.items[id]:set_visible(true)
	return self.items[id]
end


freeCtrolCtrl.clean = function(self)
	for a,b in pairs(self.items) do
		b:set_visible(false)
		self.frees[a] = b
	end
	self.items = {}
end

freeCtrolCtrl.set_item = function(self,id)
	if self.frees[id] and self.items[id] == nil then
		self.items[id] = self.frees[id]
		self.frees[id] = nil
	end
end



freeCtrolCtrl.free_item = function(self,item)
	for a,b in pairs(self.items) do
		if b == item then
			b:set_visible(false)
			self.frees[a] = b
			self.items = nil		
			return true			
		end
	end
	return false
end

