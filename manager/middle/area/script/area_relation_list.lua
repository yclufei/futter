
-- ¿‡ Ù–‘
gr_module("GmManager")

relationListArea = inherit(GmCtrl.ListBase):name("relationListArea")

relationListArea.init = function (self,parent)
	local top = self
	local win = parent.hostWindow

	local urls = {}
	urls["get"] = g_serverAddress.."relation/objects/page/%d/pagecount/%d/clsid/%d/objectid/%d"	
	urls["del"] = g_serverAddress.."relation/delete/id/%d"
	
	GmCtrl.ListBase.init(self,parent,"relationlistarea",urls)

	self.jumprelationadd = self:get_child("jumprelationaddFrame")
	self.jumprelationadd:set_click(function(self)
		local frame = top.hostWindow:addNavFrame("relationaddFrame")
		local data = {}
		data["parentcid"] = "0"
		data["parentoid"] = top.reldata.id
		data["childcid"] = ""
		data["childoid"] = ""
		data["reltype"] = ""
		data["relsubtype"] = ""
		data["relationname"] = ""

		frame:set_data(data)
	end)

	self.setitem = function(self,id,data)
		local item = self.idlist[id]
		item["data"] = data
		item["ctrl"]["updatebt"].data = data
		item["ctrl"]["deletebt"].data = data
		item["ctrl"]:set_childs_inner_text(data)
		return item
	end

	self.trans_data = function(self,b)	
		if b['parentcid'] == '0' then
			b['parentcid'] = CONST_TREE
		else
			local obj = gApp:get_object("0",b['parentcid'])
			if obj then
				b['parentcid'] = b['parentcid'].." "..obj['title']
			end
		end		
		if b['childcid'] == '0' then
			b['childcid'] = CONST_TREE
		else
			local obj = gApp:get_object("0",b['childcid'])
			if obj then
				b['childcid'] =  b['childcid'].." "..obj['title']
			end
		end
		local reltype = tonumber(b['reltype'] )
		if reltype < 0 then
			reltype = -reltype
		end
		b['reltypestr'] = CONST_RELTYPE[ tostring(reltype) ]
		local relsubtype = tonumber(b['relsubtype'] )
		if relsubtype < 0 then
			relsubtype = -relsubtype
		end
		b['relsubtypestr'] = CONST_RELSUBTYPE[ tostring(relsubtype) ]		
		b['objectidtitle1'] = top.reldata['title']					
		b['objectidtitle2'] = b['object']['title'] or b['object']['objecttitle']	
		return b		
	end
	
	
	self.init_item = function(self,item)	
		item["deletebt"] = item:get_child("deletebt")
		item["deletebt"]:set_click( function(self)
																				  top:delitem(self.data.id)	
																				end	)
		item["updatebt"] = item:get_child("updatebt")
		item["updatebt"]:set_click( function(self) 
																					local frame = top.hostWindow:addNavFrame("relationupdateFrame")
																					frame:set_data(self.data)
																				end	)
	end
	
	
	self:set_visible(true)
	
end


relationListArea.ondatacallback = function(self)
--	print("relationListArea.ondatacallback")
	self.childs.scrollcontainer:set_scroll_pos(-1,0)
	self:updatetick()
end


relationListArea.set_data = function(self,data)
	local top = self
	self.reldata = data
	local url = string.format( 	self.urls["get"] , self.curPage, self.curPageCount , data["clsid"],	data["id"] )
	self:curl( url , function(a)
				print("## set_data",url,top.curPage, top.curPageCount , data["clsid"],	data["id"])
--				table.print(a)
			 top:datacallback(a)
	  end )
	return url
end
