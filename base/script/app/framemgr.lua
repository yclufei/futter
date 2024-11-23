
gr_module("GmBase")

FrameMgr = inherit():name("FrameMgr")

FrameMgr.init = function(self,node,temp)

	local top = self
	
	
	self.ctrls = {}
	
	self.topMainScrollPos = 0
	
	
	self.mScrollViewParent = node
	self.frametempleteContainer = temp
	
	self.frame = {}	
	
	self.mNav = {}
	self.curframe = nil
	
	-- 页面模板
	self.framecreate = {}
	
	-- 方块模板
	self.areatemplete = {}
	self.areacreate = {}
	self.areas = {}
	
	-- 字段模板
	self.attrFieldsArray = {}
	self.attrFieldCreateFuncs = {}
	
	--列表item模板
	self.listItemTemplete = {}
	self.listItemTempleteCreate = {}
	
	--搜索面板模板
	self.searchPanelTemplete = {}
	self.searchPanelTempleteCreate = {}


	self.frameMoving = false
	

end

------------------------------------------------------------------------------------------------


FrameMgr.pushFrame = function(self,fname,func)
	local top = self
	
	self.frameMoving = true
	
	self:showActionMask(true)
	
	local level = self.curframe.level
	
	self.curMaskFrame = self:get_frame(fname,func)
	
	print('FrameMgr.pushFrame ',fname,self.curframe,self.curMaskFrame)
		
	if self.curMaskFrame then
		local style = string.format("position:absolute;margin-left:%d%%;top:0px;z-index:3000;",level * 100)
		self.curMaskFrame:set_style(style)
	else
		print('pushFrame '..fname..' error!!!!!!!!!!!')
	end
	
	self.curMaskFrame:on_show(4)
	
	self:showActionMask(false)
	
	self.frameMoving = false
	
	self:updatetick(true)
	
	return self.curMaskFrame
end


FrameMgr.popFrame = function(self)

	self:showActionMask(true)
	self.frameMoving = true

	self.curMaskFrame:set_style("display:none")

	self.curMaskFrame:on_hide(4)
	
	self:showActionMask(false)
	self.frameMoving = false
	
	self:updatetick()
end

------------------------------------------------------------------------------------------------

FrameMgr.addAttrField = function(self,attrtype,ctrl,func)
	self.attrFieldsArray[tonumber(attrtype)] = ctrl
	self.attrFieldCreateFuncs[tonumber(attrtype)] = func
end


FrameMgr.getAttrField = function(self,attrtype,parent,id)
	if attrtype and parent and id and self.attrFieldsArray[tonumber(attrtype)] then
		local ctrl = self.attrFieldsArray[tonumber(attrtype)]:copy()
		ctrl:set_parent(parent)
		ctrl:set_id(id)
		ctrl:releaseRef()
		self.ctrls[id] = self.attrFieldCreateFuncs[tonumber(attrtype)](parent,id)
		return self.ctrls[id]
	end
	print("!!!!!!!! has not AttrField",attrtype,parent,id)
	return nil
end

------------------------------------------------------------------------------------------------

FrameMgr.printNav = function(self,txt)
	print('------------------------ ',txt,self.topMainScrollPos,'<<<<<<')
	local sort = table.size(self.mNav)
	for i = 0,sort do
		local fname = 'noname'
		local level = 0
		if self.mNav[i] then
			fname = self.mNav[i].frameid
			level = self.mNav[i].level
		end
		print(i,fname,level)
	end
	print('------------------------ ',txt,'>>>>>>')
end

FrameMgr.exec_action = function(self,ctrl,target,attr)
	local top = self
	local framename = target
	if attr == nil then
		attr = {}
	end
	attr.tablename = ctrl.tablename
	local paramtb = string.split(target,':')
	local count = table.size(paramtb)
	print('FrameMgr.exec_action',count)
	if count >= 3 then
		framename = paramtb[1]
		local paramlen = ( count - 1 ) / 2
		for i = 1 , paramlen  do
			local idx = i * 2 
			local vidx = idx + 1
			local key = paramtb[idx]
			local value = paramtb[vidx]
			attr[key] = value
		end
	elseif count == 2 then
		framename = paramtb[1]
		return
	end

	print('FrameMgr.exec_action',ctrl.tablename,target,framename,self.frame[framename])

	if nil ~= ctrl.tablename then
		if self.frame[framename] then
			local frame = top.hostWindow:addNavFrame(framename,nil,function(frame) end)
			if frame.set_data then
				frame:set_data(attr) 
			else
				cerror('FrameMgr.exec_action error',framename,' no set_data_id ')
			end
		else
			cerror('Window.exec_action error',framename,' no frame ')
		end
	else
		cerror('FrameMgr.exec_action error',framename,ctrl.tablename,' no tablename ')
	end
	
	
--[[
	local tb = string.split(act,':')
--	table.print(tb)
	local objid = tb[2]
	local param = tb[3]
	print('FrameMgr.exec_action',framename,objid)
	if self.frame[framename] then
		top.hostWindow:addNavFrame(framename,nil,function(frame)
																	if frame.set_data_id then
																		frame:set_data_id(objid) 
																	else
																		print('FrameMgr.exec_action error',framename,' no set_data_id ')
																	end
																end)
	else
		if framename == 'url' then
			print('FrameMgr.exec_action get url ',objid..':'..param)
		else
			print('FrameMgr.exec_action error no framename ',framename)
		end
	end
	]]
	
end

FrameMgr.exec_action_by_data = function(self,framename,data)
	local top = self
	if self.frame[framename] then
		top.hostWindow:addNavFrame(framename,nil,function(frame)
																	if frame.set_data then
																		frame:set_data(data) 
																	else
																		cerror('FrameMgr.exec_action_by_data error',framename,' no set_data ')
																	end
																end)
	else
		if framename == 'url' then
			print('FrameMgr.exec_action_by_data get url ',data)
		else
			cerror('Window.exec_action_by_data error no framename ',framename)
		end
	end
end

FrameMgr.on_return_key = function(self,k)
--	print("Window.on_return_key",k)
	if self.curframe and self.curframe.on_return_key then
		self.curframe:on_return_key(k)
	end
end


FrameMgr.on_back_key = function(self,k)
	print("Window.on_back_key",k)
	if self.curframe and self.curframe.on_back_key then
		self.curframe:on_back_key(k)
	end
end

------------------------------------------------------------------------------------------------

FrameMgr.addFrameTemplete = function(self,fname,createtunc)
	self.framecreate["templete_"..fname] = createtunc
end

FrameMgr.has_frame = function(self,fname)
	return ( fname and self.frame[fname] )
end

FrameMgr.has_frame_templete = function(self,fname)
	return ( fname and self.framecreate["templete_"..fname] )
end


FrameMgr.make_frame = function(self,fname,ftemplete,mainmenu)
	if self.frame[fname] == nil then
		if self:has_frame_templete(ftemplete) then
			self.frame[fname] = self.framecreate["templete_"..ftemplete](self.mScrollViewParent)
		end
	end
	if self.frame[fname] == nil then
		cerror('canot make_frame ',fname)
	else
		self.frame[fname].framename = fname	
	end
	return self.frame[fname]
end



FrameMgr.AddFrame = function(self,fname,frame)
	self.frame[fname] = frame
end


FrameMgr.get_frame = function(self,fname,func)
	if fname then
		if self.frame[fname] ~= nil then
			self.frame[fname].framename = fname
			return self.frame[fname]
		else
			local frame = self:GetFrame(fname,func)
			if frame ~= nil then
				self.frame[fname] = frame
				self.frame[fname].framename = fname
				return frame
			end
		end		
	end
end


FrameMgr.GetFrame = function(self,fname,framecreatefunc)
	if self.frame[fname] == nil then
		if framecreatefunc ~= nil then
			if type(framecreatefunc) == 'string' then
				local frame = self:make_frame(fname,framecreatefunc,false)
				if frame ~= nil then				
					return frame
				end
			else
				self.frame[fname] = framecreatefunc(self)
				self.frame[fname]:set_parent(self.mScrollViewParent)
				self.frame[fname].framename = fname
				return self.frame[fname]
			end
		else
			local frame = self:make_frame(fname,fname,false)
			if frame ~= nil then				
				return frame
			end
		end
	end
end


FrameMgr.showFrame = function(self,fname,func)

	local moveframe = self:get_frame(fname,func)
	
	if not self.frameMoving and moveframe ~= nil and self.curframe ~= moveframe then
	
		self:layout()	
		
		self.frameMoving = true
		
		if self.curframe then
			if self.curframe.on_hide then
				self.curframe:on_hide()
			end
		end
				
		table.foreach( self.mNav , function(i,v) v:set_visible(false) end )
		self.mScrollViewParent:set_style("margin-left:0px;",false)		
		
		if moveframe.on_show then
			moveframe:on_show()
		end
		
		moveframe:show2(true,true,0)
		
		self.mNav = {}
		self.mNav[1] = moveframe
		
		if self.curframe then
			moveframe.level = self.curframe.level
		else
			moveframe.level = 1
		end
		
		self.curframe = moveframe		
		
		if self.curframe.on_show then
			self.curframe:on_show()
		end
		
		self:printNav("BigWindow.addNavFrame")
		self:updatetick(true)		
		self.frameMoving = false
	end	
	return moveframe
end


------------------------------------------------------------------------------------------------

FrameMgr.addListItemTemplete = function(self,clsid,ctrl,func)
	if clsid and ctrl and func then
		self.listItemTemplete[tonumber(clsid)] = ctrl
		self.listItemTempleteCreate[tonumber(clsid)] = func
	else
		print("Window.addListItemTemplete参数错误",clsid,ctrl,func)
	end
end

FrameMgr.getListItemTemplete = function(self,clsid,parent,id)
	if clsid and parent and id and self.listItemTemplete[tonumber(clsid)] then
		local ctrl = self.listItemTemplete[tonumber(clsid)]:copy()
		ctrl:set_parent(parent)
		ctrl:set_id(id)
		ctrl:releaseRef()
		self.ctrls[id] = self.listItemTempleteCreate[tonumber(clsid)](parent,id)
		return self.ctrls[id]
	end
	return nil
end

------------------------------------------------------------------------------------------------

FrameMgr.addSearchPanelTemplete = function(self,clsid,ctrl,func)
	if clsid and ctrl and func then
		self.searchPanelTemplete[tonumber(clsid)] = ctrl
		self.searchPanelTempleteCreate[tonumber(clsid)] = func
	else
		print("Window.addsearchPanelTemplete参数错误",clsid,ctrl,func)
	end
end


FrameMgr.getSearchPanelTemplete = function(self,clsid,parent,id)
	if clsid and parent and id and self.searchPanelTemplete[tonumber(clsid)] then
		local ctrl = self.searchPanelTemplete[tonumber(clsid)]:copy()
		ctrl:set_parent(parent)
		ctrl:set_id(id)
		ctrl:releaseRef()
		self.ctrls[id] = self.searchPanelTempleteCreate[tonumber(clsid)](parent,id)
		return self.ctrls[id]
	end
	return nil
end

------------------------------------------------------------------------------------------------

FrameMgr.on_view_size_change = function(self,left,right,top,bottom)
	print("Window.on_view_size_change ",self.curframe,left,right,top,bottom)
	if self.curframe and self.curframe.on_view_size_change then
		self.curframe:on_view_size_change(left,right,top,bottom)
	else
		print("Window.on_view_size_change error ",self.curframe,self.curframe.on_view_size_change)
	end
end


FrameMgr.MoveFrame = function(self,left,sort,efunc)
	local _,_,winW,winH = self.mScrollViewParent:get_size()
	local dd = 6
	if left then
		self.mScrollViewParent:run_scroll_pos(dd,winW,0,false,efunc or function() end)
		self.topMainScrollPos = self.topMainScrollPos + winW
	else
		self.mScrollViewParent:run_scroll_pos(dd,-winW,0,false,efunc or function() end)
		self.topMainScrollPos = self.topMainScrollPos - winW
	end
end


-- 移开顶层面板
FrameMgr.delTopNavFrame = function(self,fname)	
	local top = self
	local sort = table.size(self.mNav)
	if  not self.frameMoving then 
		self:layout(true)
	
		self.frameMoving = true
		
		if fname == nil then
			print("BigWindow.delTopNavFrame",fname,sort)
			self:MoveFrame(false, sort - 1,function(self)
																			if top.curframe then
																				top.curframe:show2(false,false)
																			end
																			top.mNav[sort] = nil	
																			top.curframe = top.mNav[ sort - 1 ]
																			top.curframe:show2(true,true,"0")
																			top:updatetick(true)
																			top:printNav("BigWindow.addNavFrame")
																			top.frameMoving = false
																 end)
			return top.mNav[ sort - 1 ]										 
		else
			local frame = self:get_frame(fname)		
			if self.mNav[sort-1] ~= frame then
				self.curframe:show2(false,false)
				self.mNav[sort] = nil
				self.curframe = self.mNav[sort-1]	
				self.curframe:show2(true,true,"0")		
				self:delTopNavFrame(fname)
				top:updatetick()
				return self.curframe
			else
				return self:delTopNavFrame()
			end
		end			
	end																							
end

FrameMgr.addNavFrame = function(self,fname,func,endfunc)	
	local top = self	
	local pendfunc = endfunc
	local moveframe = self:get_frame(fname,func)	
	if not self.frameMoving and  self.curframe ~= moveframe then
		self:layout(true)	
		self.frameMoving = true		
		local sort = table.size(self.mNav)
		moveframe:show2( true, true, sort * 100 )
		self:updatetick(true)
		self:MoveFrame(true, sort - 1,function(self)
																
																if top.curframe then
																	--top.curframe:show2(false,false)
																end
																top.curframe = moveframe
																top.mNav[sort + 1] = moveframe
																moveframe.level = sort + 1
																
																
																if pendfunc then
																	pendfunc(moveframe)
																end
																top:printNav("BigWindow.addNavFrame",sort)
																top.frameMoving = false
																top:updatetick(true)
																
																if moveframe.on_show then
																	moveframe:on_show()
																end
																
															end)
														
	end
	return moveframe	
end