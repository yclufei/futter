
-- 发表帖子
gr_module("GmManager")

orderFrame = inherit(GmBase.FrameBase):name("orderFrame")

orderFrame.init = function (self,hostWindow,freamename,hasmainmenu)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_orderFrame")

	self.tmpattrctrl = self:get_child('tmpattrctrl')
	self.tmprelctrl = self:get_child('tmprelctrl')

	self.attrsparent = self:get_child('attrsparent')
	self.relsparent = self:get_child('relsparent')
	----------------------------------------------------------------- objectdesc_add
	local addctrl = self:get_child("objectdesc_add")
	addctrl.ctrls["create_time"] = addctrl:get_child("create_time")	
	addctrl.ctrls["objectname"] = addctrl:get_child("objectname")	
	addctrl.ctrls["id"] = addctrl:get_child("id")	
	addctrl.ctrls["objecttitle"] = addctrl:get_child("objecttitle")	
	addctrl.ctrls["clsid"] = addctrl:get_child("clsid")
	addctrl.ctrls.ssfunc = function(a)
		if a ~= nil then
		end
	end
	addctrl.ctrls["submitbt"] = addctrl:get_child("submitbt")
	addctrl.ctrls["submitbt"]:remove_all_event_callback()
	addctrl.ctrls["submitbt"]:set_click(function(self)
						local create_time = addctrl.ctrls["create_time"]:get_text()
						local objectname = addctrl.ctrls["objectname"]:get_text()
						if string.len(objectname) > 0 then						
							local id = addctrl.ctrls["id"]:get_text()
							local objecttitle = addctrl.ctrls["objecttitle"]:get_text()
							local clsid = addctrl.ctrls["clsid"]:get_text()
							local url = g_serverAddress.."objectdesc/add/"	
							url = url.."create_time/"..create_time.."/"
							url = url.."objectname/"..objectname.."/"	
							url = url.."id/"..id.."/"	
							url = url.."objecttitle/"..objecttitle.."/"	
							url = url.."clsid/"..clsid.."/"	
							local postparam = {}
							postparam['attr'] = {}
							postparam['rel'] = {}
							for a,b in pairs(top.attrsctrl) do
								table.insert( postparam['attr'] ,b:get_childs_inner_text() )
							end
							for a,b in pairs(top.relsctrl) do
								table.insert( postparam['rel'] ,b:get_childs_inner_text() )
							end
							local user = gApp:get_my(13)
							local ursid = user['id']
							--top:curl(url,addctrl.ctrls.ssfunc,postparam)
						else
							print("未输入手机号码")
						end
					end)			
								
  self.post = {}  
  self.attrsctrl = {}
  self.relsctrl = {}  
	self.ctrls["objectdesc_add"] = addctrl

	self.hiddenattrctrl = {}
	self.hiddenrelctrl = {}
	


end


orderFrame.set_data = function(self,data)

	if data['rel'] then
		for a,b in pairs(data['rel']) do
			if b['reltype'] == "2" and tonumber(b["childcid"]) == 0 and self.set_clsid then
				self:set_clsid(b['childoid'])
			end
		end
	end	

end



orderFrame.set_clsid = function(self,clsid)

  self.attrsctrl = {}
  self.relsctrl = {}
  
  self.relsparent:remove_all_child()  
  self.attrsparent:remove_all_child()
  
	self.ctrls["objectdesc_add"].ctrls["clsid"]:set_text(tostring(clsid))

	local clsinfo = gApp:get_class_define_by_id(clsid)
	
  --print("orderFrame.set_clsid 3")
  


  for a,b in pairs(self.hiddenattrctrl) do
			b:set_visible(false)
  end
  for a,b in pairs(self.hiddenrelctrl) do
			b:set_visible(false)
  end

  --print("orderFrame.set_clsid 4")
  
	
	if clsinfo and clsinfo['attr'] and table.size(clsinfo['attr']) > 0 then		
		for a,b in pairs(clsinfo['attr']) do
			local id = "attr"..b.id
			local item = self.hiddenattrctrl[id]
			if item == nil then
				item = self.hostWindow:getAttrField(b.valuetype,self.attrsparent,id)
			end
			if item == nil then
				item = self.tmpattrctrl:copy()
			else
				item:set_parent(self.attrsparent)			
			end
			self.hiddenattrctrl[id] = item		
			item:set_data(b)
			item:set_parent(self.attrsparent)
			item:set_childs_inner_text(b)
			item:set_visible(true)
			self.attrsctrl[ b['id'] ] = item
		end		
	end
	
 -- print("orderFrame.set_clsid 5")
  --[[
	if clsinfo['rel'] and table.size(clsinfo['rel']) > 0 then		
		for a,b in pairs(clsinfo['rel']) do
			if tonumber(b['id']) ~= 128 and b['object'] then
				local item = self.tmprelctrl:copy()
				item.options = {}
				item:set_childs_inner_text(b['object'])
				item:set_parent(self.relsparent)
				item:set_visible(true)
				item.valuectrl = item:get_child('value')
				item.valuectrl.firstOption = item.valuectrl:get_child_by_sort(0)
				item.func = function(a)
					if a['success'] then
						local data = a['data']
						if data and table.size(data) > 0 then
							for aa,bb in pairs(data) do
								local option = item.valuectrl.firstOption:copy()
								option:set_inner_text(bb['title'])
								if bb["attr"] then
									for k,v in pairs(bb["attr"]) do
										if v['name'] == 'default' then
											option:set_attr('selected',"selected")
										end
									end
								end
								option:set_attr('value',tostring(bb['id']))
								option:set_parent(item.valuectrl)
								table.insert( item.options , option )
							end
						end
					end
				end
				local tmpstr = g_serverAddress.."tree/objects/parent_id/%d/withattr/1/withrel/1/"	
				local url = string.format(tmpstr,b['object']['id'])
				item:curl(url,item.func)
				item:set_id("relctrl"..b['id'])
				self.relsctrl[ b['object']['id'] ] = item
			end
		end	
	end
	]]
  --print("orderFrame.set_clsid 6")
  
end
  
