
-- 帖子详情
gr_module("GmBase")
objectdetailFrame = inherit(GmBase.FrameBase):name("objectdetailFrame")
objectdetailFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_objectdetailFrame")

	self.subnav = GmBase.subnavArea(self,nil,"对象详情22")
	self.subnav:set_left("NavTDWidth backNavTD",	function()	
																			top.hostWindow:delTopNavFrame()
																		end)
	
	----------------------------------------------------------------- objectdesc_update
	self.attr = self:get_child('attr')
	self.rel = self:get_child('rel')
	
	self.attrsparent = self:get_child('attrsparent')
	self.relsparent = self:get_child('relsparent')
	
	
	local updatectrl = self:get_child("objectdesc_update")
	
	self.ssfunc = function(a)			
		if a ~= nil then		
			local data = a["data"]			
			for a,b in pairs(data["attrs"]) do
				local item = self.attr:copy()
				item:set_inner_text(b['title']..":"..b['attrvalue'])
				item:set_parent(self.attrsparent)
			end				
			for a,b in pairs(data["rels"]) do
				local item = self.rel:copy()
				item:set_inner_text(b['object']['objecttitle'])
				item:set_parent(self.relsparent)
			end			
			updatectrl:set_childs_inner_text(data)
			self:updatetick()
		end		
	end
	
	
	updatectrl["submitbt"] = updatectrl:get_child("submitbt")
	updatectrl["submitbt"]:set_click(function(self)
						local url = g_serverAddress.."objectdesc/update/"							
						url = url.."create_time/"..encodeURI( updatectrl.childs["create_time"]:get_text() ).."/"							
						url = url.."objectname/"..encodeURI( updatectrl.childs["objectname"]:get_text() ).."/"							
						url = url.."id/"..encodeURI( updatectrl.childs["id"]:get_text() ).."/"							
						url = url.."objecttitle/"..encodeURI( updatectrl.childs["objecttitle"]:get_text() ).."/"							
						url = url.."clsid/"..encodeURI( updatectrl.childs["clsid"]:get_text() ).."/"						
						top:curl(url,updatectrl.ssfuncupdate)	
					end)
	
	self.ctrls["objectdesc"] = updatectrl
	
	
end
  

objectdetailFrame.set_data = function(self,data)
	local url = g_serverAddress.."objectdesc/object/withattr/1/withrel/1/id/"..data["id"]
	self:curl(url,self.ssfunc)		
end
