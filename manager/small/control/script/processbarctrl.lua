
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

ProcessBarCtrl = inherit(GmCtrl.ControlBase):name("ProcessBarCtrl")

ProcessBarCtrl.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "processbar"
	GmCtrl.ControlBase.init(self,parent,fid)

	self.nc = self:get_child("nc")
	self.tc = self:get_child("tc")
	self.process = self:get_child("process")
	
end


ProcessBarCtrl.set_data = function(self,data)

	local price = curl_data_getAttrValue(data,'price')
	local totalcount = curl_data_getAttrValue(data,'totalcount')
	local pcount = curl_data_getAttrValue(data,'pcount')
	if pcount ~= nil and totalcount ~= nil then
		self.nc:set_inner_text(tostring( pcount) )
		self.tc:set_inner_text(tostring( totalcount) )		
		local ipcount = tonumber( pcount )
		local itotalcount = tonumber( totalcount )
		if ipcount and itotalcount then
			local len =  math.ceil( ipcount * 1000 / itotalcount) / 10			
			self.process:set_attr("width",tostring( len ) .. "%")
		end
	end
end
