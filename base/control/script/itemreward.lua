
gr_module("GmCtrl")

ItemRewardCtrl = inherit(GmCtrl.ControlBase):name("ItemRewardCtrl")

ItemRewardCtrl.init = function(self,parent,elename)
	local top = self	
	GmCtrl.ControlBase.init(self,parent,elename or "ItemRewardCtrl")
	self.inititem = self:get_child('inititem')
	self.items = {}
end

ItemRewardCtrl.set_data = function(self,data)
	if data then
		data = StringToTable(data['data'] or data['threadsortshow'])
		if data and  data[ "threadsortshow" ] and data[ "threadsortshow" ]['optionlist'] then
	    for a,b in pairs(data[ "threadsortshow" ]['optionlist']) do
	    
	      if b['title'] and string.len(b['title']) > 1 then
	      
	      	if self.items[a] == nil then
		      	self.items[a] = self.inititem:copy()
		      	self.items[a]:set_parent(self)
		      	self.items[a].title = self.items[a]:get_child('title')
		      	self.items[a].value = self.items[a]:get_child('value')
		      	self.items[a]:set_style('display:box')
	      	end
	      	
	      	if b['title'] and type(self.items[a].title) == 'table'  then
	      		self.items[a].title:set_inner_text(b['title'])
	      	end
		      	
		      	
	      	if b['type'] == "select" then
	      	
	      	else
		      	if b['value'] then
		      		self.items[a].value:set_inner_text(b['value'])
		      	end
		      end
		      
	      end
	      
	     end
		end	
	end
end
