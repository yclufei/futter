

-- 已经包含整个页面的内容

gr_module("GmBase")

firstArea = inherit(GmCtrl.ControlBase):name("firstArea")

firstArea.init = function(self,parent)

	local top = self
	self.parent = parent
	
	GmCtrl.ControlBase.init(self,parent,"firstareaArea")

	self.GSortMyIndex4 = function(a,b)
		return tonumber(top.data[tostring(a)].sort) < tonumber(top.data[tostring(b)].sort);
	end		

	self.curl_callback = function(a)
		local data = a
		top.data = data['data']
		if data['success'] then
			if data['data'] and table.size(data['data']) > 0 then				
				for a,b in GSortedPairs(data['data'],top.GSortMyIndex4) do
					--table.print(b)
					if b['attr'] then
						local templete = curl_data_getAttrValue(b,'areatype')
						if templete then
							local area = self.hostWindow:make_area(top,"area"..b['id'],templete)
							if area and area.set_data then
								area:set_data(b or top.data)
							end
						end
					end
				end
			end
			self:updatetick()
		end
	end

	self:set_visible(false)
	
end


-- 自己生成数据
firstArea.set_direct_data = function(self,data)
	self.data = data
	self.curl_callback(data)
end


-- curl 请求方式
firstArea.set_data = function(self,data,aa)
	self.data = data
	local id = data['id']
	local tmpurl = g_serverAddress.."tree/childswidthobjects/page/1/pagecount/3/parent_id/%s/withattr/1/withrel/1/"
--	print("@@@aaa",tmpurl)
	local url = string.format(tmpurl,id)
	self:curl(url,self.curl_callback)
end
