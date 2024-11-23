
gr_module("GmCtrl")

ItemFieldCtrl = inherit(GmCtrl.ControlBase):name("ItemFieldCtrl")

ItemFieldCtrl.init = function(self,parent,elename)
	local top = self	
	GmCtrl.ControlBase.init(self,parent,elename or "ItemFieldCtrl")
	self.inititem = self:get_child('inititem')
	self.items = {}
end



ItemFieldCtrl.set_data = function(self,data)
	if data then
		if data and data[ "threadsortshow" ] and data[ "threadsortshow" ]['optionlist'] then
	    for a,b in pairs(data[ "threadsortshow" ]['optionlist']) do
	    
	      if b['title'] and string.len(b['title']) > 1 then
	      
	      	if self.items[a] == nil then
		      	self.items[a] = self.inititem:copy()
		      	self.items[a]:set_parent(self)
		      	self.items[a].title = self.items[a]:get_child('title')
		      	self.items[a].value = self.items[a]:get_child('value')
		      	self.items[a]:set_style('display:box')
	      	end
	      	
	      	if b['title'] then
	      		self.items[a].title:set_inner_text(b['title'])
	      	end
		      	
	      	if b['type'] ~= "select" then
		      	if b['value'] then
		      		self.items[a].value:set_inner_text(b['value'])
		      	end
		      end
		      
	      end
	      
	     end
		end	
	end
end
