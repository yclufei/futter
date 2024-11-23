
-- 对象
gr_module("GmManager")

objectdescaddFrame = inherit(GmBase.FrameBase):name("objectdescaddFrame")

objectdescaddFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"objectdescaddFrame")

	self:init_back_button()
	
	self.jumpback2 = self:get_child("jumpback2")
	self.jumpback2:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
   	
	-- objectdescaddcontent	
	self.tmpattrctrl = self:get_child('tmpattrctrl')
	self.tmprelctrl = self:get_child('tmprelctrl')

	self.attrsparent = self:get_child('attrsparent')
	self.relsparent = self:get_child('relsparent')

	----------------------------------------------------------------- objectdesc_add
	
	local addctrl = self:get_child("objectdesc_add")
	addctrl.childs = {}	
	addctrl.childs["create_time"] = addctrl:get_child("create_time")	
	addctrl.childs["objectname"] = addctrl:get_child("objectname")
	addctrl.childs["objecttitle"] = addctrl:get_child("objecttitle")	
	addctrl.childs["clsid"] = addctrl:get_child("myclsid")		
	addctrl.childs.ssfunc = function(a)
		if a ~= nil then	
			top:on_callback(a)
		end
	end
	
	addctrl.childs["submitbt"] = addctrl:get_child("submitbt")
	addctrl.childs["submitbt"]:set_click(function(self)							
						local create_time = encodeURI(addctrl.childs["create_time"]:get_text())
						local objectname = addctrl.childs["objectname"]:get_text()
						local objecttitle = addctrl.childs["objecttitle"]:get_text()
						local clsid = addctrl.childs["clsid"]:get_text()												
						local url = g_serverAddress.."objectdesc/add/"							
						url = url.."create_time/"..create_time.."/"								
						url = url.."objectname/"..objectname.."/"					
						url = url.."objecttitle/"..objecttitle.."/"								
						url = url.."clsid/"..clsid.."/"		
						
						local postparam = {}						
						postparam['attr'] = {}
						postparam['rel'] = {}						
						for a,b in pairs(top.attrsctrl) do
							local bb = b:get_childs_inner_text()
							bb['clsid'] = top.data['id']
							table.insert( postparam['attr'] , bb)
						end
						for a,b in pairs(top.relsctrl) do
							local bb = b:get_childs_inner_text()
							bb['clsid'] = bb['selectparent_id']
							bb['relationname'] = bb['relrelationname']
--							table.print(bb)
							table.insert( postparam['rel'] ,bb )
						end
--						table.print(postparam['attr'])
--						table.print(postparam['rel'])
						top:curl(url,addctrl.childs.ssfunc,postparam)	
					end)					
	self.ctrls["objectdesc_add"] = addctrl
  
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
  
  self.post = {}
  
  self.attrsctrl = {}
  self.relsctrl = {}
	self.addobjtitle = self:get_child('addobjtitle')
	
	self.hiddenattrctrl = {}
	self.hiddenrelctrl = {}
end
 
 
 
objectdescaddFrame.set_data = function(self,data)
	local top = self
	self.addobjtitle:set_inner_text(data['title'])
	self.data = data
	self.ctrls["objectdesc_add"].childs["clsid"]:set_text(data["id"])	
	local clsinfo = gApp:get_class_define(data['name'])
	
--	table.print(data)
--	table.print(clsinfo)
	  
  self.attrsctrl = {}
  self.relsctrl = {}
  
  self:updatetick()
  
  for a,b in pairs(self.hiddenattrctrl) do
			b:set_visible(false)
  end
  for a,b in pairs(self.hiddenrelctrl) do
			b:set_visible(false)
  end
  
	if clsinfo then

		-- 添加属性控件
		if clsinfo['attr'] and table.size(clsinfo['attr']) > 0 then		
			for a,b in pairs(clsinfo['attr']) do
				if b.id then
					local id = "attr"..b.id
					local item = self.hiddenattrctrl[id]
					if item == nil then
						item = self.hostWindow:getAttrField(b.valuetype,self.attrsparent,id)
					end
					if item == nil then
						item = self.tmpattrctrl:copy()
					end
					if item then
						item:set_parent(self.attrsparent)	
						item:set_visible(true)
						self.hiddenattrctrl[id] = item
						--item:set_data(b)
						b['otitle'] = b['title']
						item:set_childs_inner_text(b)
						self.attrsctrl[ b['id'] ] = item
					end
				else
--					print("attr item no id")
				end		
			end		
		end
		
		-- 添加关联控件
		if clsinfo['rel'] and table.size(clsinfo['rel']) > 0 then		
			for a,b in pairs(clsinfo['rel']) do			
				if tonumber(b.reltype) > 0 and b.id then
					local id = "rel"..b.id
					local item = self.hiddenrelctrl[id]
					if item == nil and b['relationname'] then
						item = self.tmprelctrl:copy()
						item.relationnamectrl = item:get_child('relrelationname')
						item.options = {}						
						item.valuectrl = item:get_child('value')
						item.valuectrl.data = b
						item.valuectrl.selectobjecttitle = item:get_child('selectobjecttitle')
						item.valuectrl.selectparent_id = item:get_child('selectparent_id')
						item.valuectrl:set_click(function(self)	
																					local ctrl = self
																					local reltype = tonumber(self.data.reltype)
																					local relsubtype = tonumber(self.data.relsubtype)
																					if reltype == 4 then
																						local coid = self.data.childoid
																						local frame = top.hostWindow:show_popup("poptreelistFrame",coid)
																						frame.callback = function(frame,cdata)
--																							table.print(cdata)
																							item:set_childs_inner_text(cdata)
																							ctrl.data["select"] = cdata
																							self:set_text(cdata['id'])
																							self.selectobjecttitle:set_text(cdata['title'])
																							self.selectparent_id:set_text(cdata['parent_id'])
--																							table.print(cdata)
																						end							
																					else
																						local typeid = tonumber( self.data.childoid )
																						local frame = top.hostWindow:show_popup("popobjectlistFrame",typeid)
																						frame.callback = function(frame,cdata)
																							ctrl.data["select"] = cdata
																							self:set_text(cdata['id'])
																							self.selectobjecttitle:set_text(cdata['objecttitle'])
																							self.selectparent_id:set_text(cdata['clsid'])
																						end
																					end						
																				end)
					
					end
					self.hiddenrelctrl[id] = item
					item:set_childs_inner_text(b)
					if b['object'] then
						item:set_childs_inner_text(b['object'])
					end
					item:set_parent(self.relsparent)
					item:set_visible(true)
					if b['object'] and b['object']['id'] then
						self.relsctrl[ b['object']['id'] ] = item
					end
					item.relationnamectrl:set_text(b['relationname'])
				end	
			end	
		end	
	end
	
	
	self:updatetick()
	
	self.ctrls["objectdesc_add"]:save_file("add_service.html")
				
end
  
