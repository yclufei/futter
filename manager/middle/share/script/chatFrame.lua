

gr_module("GmManager")

chatFrame = inherit(GmBase.FrameBase):name("chatFrame")

chatFrame.init = function (self,hostWindow,frameid)

	local top = self
	local win = hostWindow
	
	local fid = frameid or "chatFrame"
	GmBase.FrameBase.init(self,hostWindow,fid)

	self:init_back_button()
			
	gXmpp.on_recv_msg = function(self,jid,msg)	
		local jidarray = string.split(jid,"@")
		local name = jidarray[1]
		if not top:has_urs(name) then
			top:add_urs(jid)
		end	
		GmBase.Xmpp.on_recv_msg(self,jid,msg)	
	end
	
	self.talkbar = self:get_child("talkbar")
		
	-- 文字输入条
	self.msgtext = self.talkbar:get_child("msgtext")
	self.msgtext:set_keyup(function(self,a,b,c,d)
--		print(a,b,c,d)
			if tonumber(d) == 23 or tonumber(d) == 66 or tonumber(d) == 13 then
				if top.currentUrs then
					local u = top.msgtext:get_text()
--					print(top.currentUrs,u)
					gXmpp:sendmsg(top.currentUrs,u)
					top:add_my_msg(top.currentUrs,u)
				end		
			end
		end)	
			
	self.msgtext:set_click(	function(self)
															top.btsendmsg:set_visible(true)
															top.btvoicesendmsg:set_visible(false)	
															top:updatetick()
													end)

	-- 发送按钮
	self.btsendmsg = self.talkbar:get_child("btsendmsg")
	self.btsendmsg:set_click( function(self)
	
															if top.currentUrs then
															
																top.msgtext:set_focus(true)
																local msg = top.msgtext:get_text()
																gXmpp:sendmsg(top.currentUrs,msg)
																if msg and string.len(msg) > 0 then
																	if string.byte(getGBK(msg),1) == 35 then
																		top:add_order_msg(top.currentUrs,string.sub(msg,2,string.len(msg)-2))																		
																	else
																		top:add_my_msg(top.currentUrs,msg)
																	end
																end
																top.msgtext:set_text("")
																
															end		
														end )

	self.btvoicesendmsg = self.talkbar:get_child("btvoicesendmsg")
	self.btvoicesendmsg:set_click( function(self)
															if top.currentUrs then
																local u = top.msgtext:get_text()
																gXmpp:sendmsg(top.currentUrs,u)
																top:add_my_msg(top.currentUrs,u)		
																top.btsendmsg:set_visible(true)
																self:set_visible(false)	
																top:updatetick()
															end		
														end )
	
	-- 声音输入条						
	hostWindow.on_voice_result = function(self,str)
		top.voicestr = top.voicestr..str
		top.msgtext:set_text(top.voicestr)
	end
	
	-- 支付回调
	hostWindow.on_net_pay = function(self,er,ret,str1,str2)
		if top.currentUrs then
			top:add_my_msg(top.currentUrs,"Window.on_net_pay "..tostring(er).." "..tostring(ret).." "..str1.." "..str2)
		end		
	end

	self.voicestr = ""
	
	-- 添加服务单
	self.btaddservice = self.talkbar:get_child("btaddservice")
	self.btaddservice:set_click( 	function(self)
																		local frame = top.hostWindow:addNavFrame("objectdescaddFrame")
																		if frame and frame.set_data then
																			frame:set_callback( function(frame,data)
																														if top.currentUrs and data["success"] and data["data"] and table.size(data["data"]) > 0 then
																															local str = "# "..TableToString(data["data"])
--																															print(str)
																															top:add_order_msg(top.currentUrs,data["data"]["objecttitle"])	
																															gXmpp:sendmsg(top.currentUrs,str)
																															top.hostWindow:delTopNavFrame()
																														end
																													end)
																			-- 如果是栏目，要拿属性的clsid
																			local data = {}
																			data['title'] = '服务单'
																			data['id'] = '121'
																			data['name'] = 'order'
																			frame:set_data(data)
																		end
																end )
	
	
	-- 声音输入
	self.btvoicemsg = self.talkbar:get_child("btvoicemsg")
	self.btvoicemsg:set_click( 	function(self)
																top.voicestr = ""
																hostWindow:voiceToWord()
																top.btsendmsg:set_visible(false)
																top.btvoicesendmsg:set_visible(true)
																top:updatetick()
															end )


	self.msglist = GmCtrl.ListBase(self,"slistscrolllist",{})
	
	self.initmyitem = self.msglist.hiddenparent:get_child("initItem")	
	self.inittimeitem = self.msglist.hiddenparent:get_child("inittimeitem")	
	self.initfansitem = self.msglist.hiddenparent:get_child("initfansitem")
	self.initorderitem = self.msglist.hiddenparent:get_child("initorderitem")

	self.ursSelectLists = self:get_child("ursSelectLists")
	self.initursselect = self:get_child("initursselect")
	
	self.msgctrllists = {}
	self.ursselectctrllists = {}
	self.currentMsgCtrl = nil
	self.currentUrs = nil
	self.currentName = nil
	
end


chatFrame.has_urs = function(self,name)
--	print("chatFrame.has_urs",self.msgctrllists[name] == nil and self.ursselectctrllists[name] == nil)
	return self.msgctrllists[name] ~= nil and self.ursselectctrllists[name] ~= nil
end


chatFrame.set_current_urs = function(self,jid)
	local top = self	
	local jidarray = string.split(jid,"@")
	local name = jidarray[1]		
	if self.currentMsgCtrl == nil or self.currentMsgCtrl ~= self.msgctrllists[name] then	
		for a,b in pairs(self.ursselectctrllists) do
			b:set_style("padding:5px;color:#333333;background-color:#ffffff;")
		end		
		self.ursselectctrllists[name]:set_style("padding:5px;color:#ffffff;background-color:#333333;")
		if self.currentMsgCtrl ~= nil	then
			self.currentMsgCtrl:set_visible(false)
		end		
		self.currentMsgCtrl = self.msgctrllists[name]
		self.currentMsgCtrl:set_visible(true)		
		self.msglist.listParent = self.currentMsgCtrl		
		self.currentUrs = jid
		self.currentName = name
	end
	self:updatetick()	
end


chatFrame.add_urs = function(self,jid)
	local top = self
	local jidarray = string.split(jid,"@")
	local name = jidarray[1]
	local ursselect = self.initursselect:copy()
	ursselect:set_inner_text(name)
	ursselect.jid = jid
	ursselect:set_visible(true)
	ursselect:set_parent(self.ursSelectLists)
	ursselect:set_click( 	function(bt)
													top:set_current_urs(bt.jid)
												end	)
	self.ursselectctrllists[name] = ursselect	
	local msgctrl = self.msglist.listParent:copy()
	msgctrl:remove_all_child()
	msgctrl:set_visible(false)
	msgctrl:set_parent(self.msglist.childs.scrollcontainer)	
	self.msgctrllists[name] = msgctrl	
	gXmpp:add_msg_handler(name,function(jid,msg)
--																print("chatFrame.msg_handler",jid,msg)																
																if msg and string.len(msg) > 0 then
																	if string.byte(getGBK(msg),1) == 35 then
																		top:add_order_msg(jid,string.sub(msg,2,string.len(msg)-2))																		
																	else
																		top:add_fans_msg(jid,msg)
																	end
																end
															end)														
	if self.currentUrs == nil then
		top:set_current_urs(jid)
	else
		for a,b in pairs(self.ursselectctrllists) do
			b:set_style("padding:5px;color:#333333;background-color:#ffffff;")
		end		
		self.ursselectctrllists[self.currentName]:set_style("padding:5px;color:#ffffff;background-color:#333333;")		
	end	
	self:updatetick()
end



chatFrame.remove_urs = function(self,jid)

end


chatFrame.add_item = function(self,jid,item)
	local jidarray = string.split(jid,"@")
	local jidname = jid
	if jidarray and table.size(jidarray) > 1 then
		jidname = jidarray[1]
	end
	local top = self
	local id = tostring(table.size(self.msglist.idlist))
	item:set_attr("id","id"..id)
--	item:set_use_cache(true)
	self.msglist.idlist[id] = item			
	item:set_parent(self.msgctrllists[jidname])
	self.lastItem = item	
	self:set_chat_pos()
end


chatFrame.add_fans_msg = function(self,jid,msg)
	local item = self.initfansitem:copy()	
	item.content = item:get_child("content")
	item.content:set_inner_text(msg)
	self:add_item(jid,item)
end



chatFrame.add_my_msg = function(self,jid,msg)
--	print(jid,item)
	local item = self.initmyitem:copy()	
	item.content = item:get_child("content")
	item.content:set_inner_text(msg)
	self:add_item(jid,item)
	self.msgtext:set_text("")
end


chatFrame.add_time_msg = function(self,jid,msg)
	local item = self.inittimeitem:copy()	
	item:set_inner_text(msg)
	self:add_item(jid,item)
end


chatFrame.add_order_msg = function(self,jid,msg)
	local top = self
	local item = self.initorderitem:copy()	
	item.content = item:get_child("content")
	item.content:set_inner_text(msg)
	item.content:set_click(	function()
														top.hostWindow:net_pay("upmp",100)
													end)
													
	item.btconfirm = item:get_child("btconfirm")
	item.btconfirm:set_click(	function()
--														aprint("lua netPay")
														top.hostWindow:net_pay("upmp",100)
													end)
													
	self:add_item(jid,item)
end


chatFrame.set_chat_pos = function(self)

	if self.lastItem then
		local ol,ot,ow,oh, cl,ct,cw,ch, sl,st,sw,sh = self.msglist.childs.scrollcontainer:get_size()
--		aprint( string.format("scrollcontainer : %d - %d - %d - %d - %d - %d - %d - %d - %d - %d - %d - %d",ol,ot,ow,oh, cl,ct,cw,ch, sl,st,sw,sh) )
		
		local ol2,ot2,ow2,oh2, cl2,ct2,cw2,ch2, sl2,st2,sw2,sh2  = self.talkbar:get_size()
--		aprint( string.format("talkbar : %d - %d - %d - %d - %d - %d - %d - %d - %d - %d - %d - %d", ol2,ot2,ow2,oh2,cl2,ct2,cw2,ch2,sl2,st2,sw2,sh2) )
		
		local ol3,ot3,ow3,oh3, cl3,ct3,cw3,ch3, sl3,st3,sw3,sh3  = self.lastItem:get_size()
--		aprint( string.format("item : %d - %d - %d - %d - %d - %d - %d - %d - %d - %d - %d - %d",ol3,ot3,ow3,oh3, cl3,ct3,cw3,ch3, sl3,st3,sw3,sh3 ) )
	
	
		self.msglist:set_scroll_pos(-1, ot3 - 50 )
	end
	
	
	self:updatetick()

end


chatFrame.on_view_size_change = function(self,left,right,top,bottom)
	self.topdis = bottom-top-52
	local str = "top:"..tostring(self.topdis).."px"	
--	aprint("chatFrame.on_view_size_change "..str)
--	aprint(tostring(left))
--	aprint(tostring(right))
--	aprint(tostring(top))
--	aprint(tostring(bottom))
	self.talkbar:set_style(str)
	self:set_chat_pos()
end
