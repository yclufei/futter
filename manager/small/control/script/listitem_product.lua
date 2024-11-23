
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

myProductItem = inherit(GmCtrl.ControlBase):name("myProductItem")

myProductItem.init = function (self,parent,itemid)

	local top = self
	local fid = itemid or "listitem_myproduct"
	GmCtrl.ControlBase.init(self,parent,fid)
	if not itemid then
		self:set_visible(false)
	end
	self.clickmask = self:get_child("clickmask")
	
	self.bar = GmControl.ProcessBarCtrl(self)
	
	self.smallimage = self:get_child("smallimage")
	
	self.frame = nil
end


myProductItem.on_timeout = function(self)
	self.frame:set_data(self.data)
end

myProductItem.set_data = function(self,data)
	local top = self
	self.data = data
	self.bar:set_data(data)
	
	local imgsrc = curl_data_getAttrValue(data,'smallimage')
	if imgsrc and string.len(imgsrc) > 0 then
		self.smallimage:set_src("testimages/"..imgsrc..".jpg")
	end
	data['objid'] = data['id']
	self:set_childs_inner_text(data)
	self.clickmask:set_click( function(self)
														
															top.frame = top.hostWindow:addNavFrame("productdetailFrame")																	
															top:set_timeout(12)
																
														end)
end
