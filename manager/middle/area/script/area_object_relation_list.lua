
-- 对象关联面板

gr_module("GmManager")

objectRelationListArea = inherit(GmCtrl.ListBase):name("objectRelationListArea")

objectRelationListArea.init = function (self,parent)

	local top = self
	local win = parent.hostWindow
	
	local urls = {}
	urls["get"] = g_serverAddress.."relation/objects/page/%d/pagecount/%d/clsid/%d/objectid/%d"	
	urls["del"] = g_serverAddress.."relation/delete/id/%d"
		
	GmCtrl.ListBase.init(self,parent,"objectrelationlistarea",urls)
	
	self.setitem = function(self,id,data)	
		-- 给下拉控件使用
		data['reltypestr'] = CONST_RELTYPE[ data['reltype'] ]
		data['relsubtypestr'] = CONST_RELSUBTYPE[ data['relsubtype'] ]		
		local item = self.idlist[id]
		item["data"] = data
		item["ctrl"]["addbt"].data = data
		item["ctrl"]["objectlist"]:set_data(data)
		item["ctrl"]:set_childs_inner_text(data)
		--print("self.setitem end")
		return item
	end
		
	self.trans_data = function(self,data)	
		local b = data['object']
		if b then
			data['objectidtitle2'] = b['title'] or b['objecttitle']
		end
		data['objectidtitle1'] = top.reldata["objecttitle"]			
		data['sreltype'] = data['reltype']
		data['srelsubtype'] = data['relsubtype']	
		data['parentcid'] = top.reldata['clsid']
		data['parentoid'] = top.reldata['id']
		--print("self.trans_data end")
		return data
	end
		
	self.init_item = function(self,item)

		local frame = top		
		local urls = {}
		urls["get"] = g_serverAddress.."relation/search/page/1/pagecount/10/clsid/%d/objectid/%d"	
		urls["del"] = g_serverAddress.."relation/delete/id/%d"
		item["objectlist"] = GmCtrl.ListBase(item,"scrolllist",urls) -- 每个关联是一个列表
		item["objectlist"].trans_data = top.trans_data		
		item["objectlist"].set_data = function(self,data)	
			--[[
			table.print(data)	
			local parentcid = tostring(frame.reldata.clsid)
			local parentoid = tostring(frame.reldata.id)			
			local reltype = tostring(data.reltype)
			local relsubtype = tostring(data.relsubtype)			
			local url = g_serverAddress.."relation/search/"                                                                                                                                      
			url = url.."relationname/"..data.relationname
			url = url.."/parentcid/"..parentcid
			url = url.."/parentoid/"..parentoid								
			--url = url.."/reltype/"..reltype			
			--print("###########",url)						
			if tonumber(reltype) == 4 then			
				if data.object then				
					if data.object.childids then					
						local childoid = nil
						for a,b in pairs(data.object.childids) do
							if childoid == nil then
								childoid = b.id
							else
								childoid = childoid..","..b.id
							end
						end
						url = url.."/childoid/"..childoid
						--print("# 1 ",url)
						self:curl(url,function(a)
									--table.print(a)
									local clsdata = a
									if clsdata['success'] then
										self:datacallback(a)
									end
							 	end,postparam)						
					else					
						print("has not childids!!!!!")						
					end					
				end				
			else				
				url = url.."/childcid/"..tostring(data.childoid)
				--print("# 2 ",url)
				self:curl(url,function(a)
									--table.print(a)
									local clsdata = a
									if clsdata['success'] then
										self:datacallback(a)
									end
							 	end,postparam)				
			end		
			]]	
		end						
		item["addbt"] = item:get_child("addbt")
		item["addbt"]:set_click( function(self) 
															local frame = top.hostWindow:addNavFrame("relationaddFrame")
															frame:set_data(self.data)
														 end	)
		--print("self.init_item end")
	end
	self.jumprelationadd = self:get_child("jumprelationaddFrame")
	self.jumprelationadd:set_click(function(self)
		local frame = top.hostWindow:addNavFrame("relationaddFrame")
		frame:set_data(top.reldata)
	end)
	self:set_visible(true)	
	self.clsRelData = nil	
end


objectRelationListArea.ondatacallback = function(self)
	--[[
	self.childs.scrollcontainer:set_scroll_pos(-1,0)
	self:updatetick()
	]]
end

objectRelationListArea.set_data = function(self,data)
	local top = self
	self.reldata = data
	local clsRelUrl = string.format( self.urls["get"] ,self.curPage ,self.curPageCount , "0",	data["clsid"])
	print("objectRelationListArea.set_data",clsRelUrl)
	
	self:curl(clsRelUrl,function(a)
									local clsdata = a
										table.print(a)
									if clsdata['success'] then
										top.clsRelData = a
										top:datacallback(top.clsRelData)
									end
							 	end)
							 	
end

