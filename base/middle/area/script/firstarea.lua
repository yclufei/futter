
gr_module("GmBase")

firstArea = inherit(GmCtrl.ControlBase):name("firstArea")

firstArea.init = function(self,parent)

	local top = self
	self.parent = parent
	
	GmCtrl.ControlBase.init(self,parent,"firstarea")

	self.ssfunc = function(a)
		local data = a
		if data['success'] then
			if data['data'] and table.size(data['data']) > 0 then				
				for a,b in pairs(data['data']) do
					--table.print(b)
					if b['attr'] then
						local templete = b['attr']['areatype']['title']
						local area = self.hostWindow:make_area(top,"area"..b['id'],templete)
						area:set_data(b or top.data)
					end
				end
			end
			self:updatetick()
		end
	end

	self:set_visible(false)
	
end

firstArea.set_data = function(self,data,aa)
	self.data = data
	local id = data['id']
	local tmpurl = g_serverAddress.."tree/childswidthobjects/page/1/pagecount/3/parent_id/%s/withattr/1/withrel/1/"
	local url =  string.format(tmpurl,id)
	self:curl(url,self.ssfunc)
end
