
-- relationadd
gr_module("GmManager")

relationaddFrame = inherit(GmBase.FrameBase):name("relationaddFrame")

relationaddFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"relationaddFrame")

   	
	-- subnav	  
	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
     	
	self.jumpback2 = self:get_child("jumpback2")
	self.jumpback2:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
	
	-- relationaddcontent	 	   
	----------------------------------------------------------------- relation_add
	local addctrl = self:get_child("relation_add")
	addctrl.childs = {}	
	
	
	
	addctrl.childs["reltype"] = addctrl:get_child("reltype")
	addctrl.childs["reltype"].initoption = addctrl.childs["reltype"]:get_child("inititem")
	addctrl.childs["reltype"].options = {}
	for a,b in pairs(CONST_RELTYPE) do
		local item = addctrl.childs["reltype"].initoption:copy()
		item:set_attr("value",a)
		item:set_inner_text(b)
		item:set_parent(addctrl.childs["reltype"])
		addctrl.childs["reltype"].options[a] = item
	end
	addctrl.childs["reltype"]:set_change(function(self,a,b)
																					addctrl.childs["sreltype"]:set_text( self:get_value() )
																				end)
	
	addctrl.childs["relsubtype"] = addctrl:get_child("relsubtype")
	addctrl.childs["relsubtype"].initoption = addctrl.childs["relsubtype"]:get_child("inititem")
	addctrl.childs["relsubtype"].options = {}
	for a,b in pairs(CONST_RELSUBTYPE) do
		local item = addctrl.childs["relsubtype"].initoption:copy()
		item:set_attr("value",a)
		item:set_inner_text(b)
		item:set_parent(addctrl.childs["relsubtype"])
		addctrl.childs["relsubtype"].options[a] = item
	end
	addctrl.childs["relsubtype"]:set_change(function(self,a,b)
																					addctrl.childs["srelsubtype"]:set_text( self:get_value() )
																				end)
	
	
	addctrl.childs["relationname"] = addctrl:get_child("relationname")
	addctrl.childs["parentcid"] = addctrl:get_child("parentcid")
	addctrl.childs["parentoid"] = addctrl:get_child("parentoid")
	addctrl.childs["childcid"] = addctrl:get_child("childcid")
	addctrl.childs["childcid"]:set_click(function(self) 
																					local frame = top.hostWindow:show_popup("poptreelistFrame","0") 
																					frame.callback = function(frame,data)
																						self:set_text(data['id'])
																					end
																				end)
																					
	addctrl.childs["childoid"] = addctrl:get_child("childoid")
	addctrl.childs["childoid"]:set_click(function(self) 
																					local childcid = tonumber(addctrl.childs["childcid"]:get_text() )
																					local reltype = tonumber(top.src_data.reltype)
																					local relsubtype = tonumber(top.src_data.relsubtype)
--																					print(childcid,reltype,relsubtype)
																					if reltype == 4 or childcid == 0 then
--																						print("AAAAAAAAAAAAAA")
																						local coid = top.src_data.childoid
																						if "" == coid then
																							coid = childcid
																						end
																						local frame = top.hostWindow:show_popup("poptreelistFrame",tostring(coid) )
																						frame.callback = function(frame,data)
																							self:set_text(data['id'])
																						end																					
																					else
																						local typeid = tonumber( addctrl.childs["childcid"]:get_text() )
--																						print("BBBBBBBBBBBBBBB")
																						local frame = top.hostWindow:show_popup("popobjectlistFrame",typeid) 
																						frame.callback = function(frame,data)
																							self:set_text(data['id'])
																						end
																					end
																					
																				end)
																				
																				
	addctrl.childs["sreltype"] = addctrl:get_child("sreltype")
	addctrl.childs["srelsubtype"] = addctrl:get_child("srelsubtype")	
	
	addctrl.childs.ssfunc = function(a)
		if a ~= nil then
			local data = a
			if data['success'] then
				top.hostWindow:delTopNavFrame()
			end
		end
	end
	
	addctrl.childs["submitbt"] = addctrl:get_child("submitbt")
	addctrl.childs["submitbt"]:set_click(function(self)		
					
	
						local relationname = addctrl.childs["relationname"]:get_text()
						local parentcid = addctrl.childs["parentcid"]:get_text()
						local childcid = addctrl.childs["childcid"]:get_text()
						local parentoid = addctrl.childs["parentoid"]:get_text()
						local childoid = addctrl.childs["childoid"]:get_text()
						local reltype = addctrl.childs["reltype"]:get_text()
						local relsubtype = addctrl.childs["relsubtype"]:get_text()
						
						
						local url = g_serverAddress.."relation/add/"	
						url = url.."relationname/"..relationname.."/"
						url = url.."parentcid/"..parentcid.."/"
						url = url.."childcid/"..childcid.."/"
						url = url.."parentoid/"..parentoid.."/"
						url = url.."childoid/"..childoid.."/"
						url = url.."reltype/"..reltype.."/"
						url = url.."relsubtype/"..relsubtype.."/"
						
						top:curl(url,addctrl.childs.ssfunc)	
					end)	
					
	self.ctrls["relation_add"] = addctrl
	
	self:set_visible(false)
  
	
end
  
relationaddFrame.set_data = function(self,data)
	self.src_data = data
	self.ctrls["relation_add"]:set_childs_inner_text(data)
	if tonumber(data.reltype) == 7 then
		self.ctrls["relation_add"].childs["childcid"]:set_text(data.childoid)
	end
end


  
