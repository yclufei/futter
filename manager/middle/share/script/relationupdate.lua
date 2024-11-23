-- relationupdate
gr_module("GmManager")
relationupdateFrame = inherit(GmBase.FrameBase):name("relationupdateFrame")
relationupdateFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"relationupdateFrame")

   	
	-- subnav	  
	self:init_back_button()
     	
	self.jumpback2 = self:get_child("jumpback2")
	self.jumpback2:set_click(function(self)
		top.hostWindow:delTopNavFrame()
	end)
	
	-- relationupdatecontent	 	   
	----------------------------------------------------------------- relation_add
	local addctrl = self:get_child("relation_update")
	addctrl.childs = {}	
	
	

	self.ss = self:get_child("ss")
	self.ss.optionitem = self.ss:get_child("optionitem")
	self.ss.options = {}
	
	self.ss.options[1] = self.ss.optionitem:copy()
	self.ss.options[1]:set_attr("value","5")
	self.ss.options[1]:set_inner_text("55555")
	self.ss.options[1]:set_parent(self.ss)
	
	self.ss:set_change(	function(self)
												top:tick()
												top:updatetick()
											end)
	
							
	addctrl.childs["id"] = addctrl:get_child("id")
	addctrl.childs["parentcid"] = addctrl:get_child("parentcid")
	
	
	addctrl.childs["parentoid"] = addctrl:get_child("parentoid")
	addctrl.childs["relationname"] = addctrl:get_child("relationname")
	
	addctrl.childs["childcid"] = addctrl:get_child("childcid")
	addctrl.childs["childcid"]:set_click(function(self) 
																					local frame = top.hostWindow:show_popup("poptreelistFrame","0") 
																					frame.callback = function(frame,data)
																						self:set_text(data['id'])
																					end
																				end)
																					
	addctrl.childs["childoid"] = addctrl:get_child("childoid")
	addctrl.childs["childoid"]:set_click(function(self) 
																					local typeid = tonumber( addctrl.childs["childcid"]:get_text() )
																					if typeid == 0 then
																						local frame = top.hostWindow:show_popup("poptreelistFrame","1") 
																						frame.callback = function(frame,data)
																							self:set_text(data['id'])
																						end
																					else
																						local frame = top.hostWindow:show_popup("popobjectlistFrame",typeid) 
																						frame.callback = function(frame,data)
																							self:set_text(data['id'])
																						end
																					end
																				end)
																				
																				
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
						local id = addctrl.childs["id"]:get_text()
						local childcid = addctrl.childs["childcid"]:get_text()
						local parentoid = addctrl.childs["parentoid"]:get_text()
						local childoid = addctrl.childs["childoid"]:get_text()
						local reltype = addctrl.childs["reltype"]:get_text()
						local relsubtype = addctrl.childs["relsubtype"]:get_text()
						
						local url = g_serverAddress.."relation/update/"	
						url = url.."id/"..id.."/"
						url = url.."relationname/"..relationname.."/"
						url = url.."childcid/"..childcid.."/"
						url = url.."parentoid/"..parentoid.."/"
						url = url.."childoid/"..childoid.."/"
						url = url.."reltype/"..reltype.."/"
						url = url.."relsubtype/"..relsubtype.."/"
						
						top:curl(url,addctrl.childs.ssfunc)
						
					end)	
					
	self.ctrls["relation_update"] = addctrl
	
	self:set_visible(false)
  
	
end
  
relationupdateFrame.set_data = function(self,data)
--	table.print(data)
	if data and data['id'] then
		self.ctrls["relation_update"]:set_childs_inner_text( data )
	end
end


  
