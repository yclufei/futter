
gr_module("GmCtrl")

ItemAddressCtrl = inherit(GmBase.Node):name("ItemAddressCtrl")

ItemAddressCtrl.init = function(self,parent,elename,title,data,callback)
	local top = self
	
	GmBase.Node.init_by_parent(self,parent,elename or "ItemAddressCtrl")
	
	self.ctrlcallback = callback
	self.titleValue = title
	
	self.ItemAddressCtrl = self:get_child('ItemAddressCtrl')
	self.ItemAddressCtrl:dont_handle_event(true)
	
	self.cprovince = self.ItemAddressCtrl:get_child('province')
	self.ccity = self.ItemAddressCtrl:get_child('city')
	self.cdist = self.ItemAddressCtrl:get_child('dist')
	self.ccommunity = self.ItemAddressCtrl:get_child('community')
	
	self.ctltitle = self.ItemAddressCtrl:get_child('title')
	self.ctltitle:dont_handle_event(true)
	self.ctltitle:set_inner_text(self.titleValue)
	
	self.ctlvalue = self.ItemAddressCtrl:get_child('value')
	self.ctlvalue:dont_handle_event(true)
	
	self:set_click(function(ctrl)
		local pop = top.hostWindow.popmanager:show_pop('address',true)
		pop:set_title(top.titleValue)
		pop:set_data(top.data,top.ctrlcallback)
		top:updatetick(true)
	end)
	
	self:set(data,data)
end

ItemAddressCtrl.set = function(self,key,value)
	self:set_text(value)
	self:layout()
	self:updatetick(true)
end

ItemAddressCtrl.get_text = function(self)
	return self.ctlvalue:get_inner_text()
end


ItemAddressCtrl.set_text = function(self,pdata)
	if table.size(pdata) > 0 then
		self.data = pdata
		
		--print('ItemAddressCtrl.set_text')
		--table.print(pdata)
		
		self.cprovince:set_text('')
		self.ccity:set_text('')
		self.cdist:set_text('')
		self.ccommunity:set_text('')
		
		if pdata['province'] then
			for a,b in pairs(pdata['province']) do 
				self.cprovince.pid = a
				self.cprovince:set_text(b) 
			end
			
			if pdata['city'] then
				for a,b in pairs(pdata['city']) do 
					self.ccity.pid = a
					self.ccity:set_text(b)
				end
				
				if pdata['dist'] then
					for a,b in pairs(pdata['dist']) do
						self.cdist.pid = a
						self.cdist:set_text(b) 
					end
					
					if pdata['community'] then
						for a,b in pairs(pdata['community']) do 
							self.ccommunity.pid = a
							self.ccommunity:set_text(b) 
						end
					end
				end
			end
		end
		
		local showaddr = self.cprovince:get_text() 
		
		if self.ccity:get_text() then
			showaddr = showaddr..self.ccity:get_text()
		end
		
		if self.cdist:get_text() then
			showaddr = showaddr..self.cdist:get_text()
		end
		
		if self.ccommunity:get_text() then
			showaddr = showaddr..self.ccommunity:get_text()
		end
		
		self.ctlvalue:set_inner_text(showaddr)
	end
	
end
