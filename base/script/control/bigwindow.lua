-- PC客户端基类
gr_module("GmBase")

BigWindow = inherit(GmBase.Window):name("BigWindow")

BigWindow.init = function (self,html,fmgr)
	local top = self
	local win = self
		
	GmBase.Window.init(self,html,fmgr)
	
end


BigWindow.on_sys_button = function(self,stype)
	if stype == "min" then
		self:minbox()
	elseif stype == "max" then
		self:maxbox()
	else
		self:hideWindow()
	end
	self:updatetick()
end


--设置移动区域
BigWindow.set_drag_element = function(self,eid)
	self.drag = self:get_child(eid)
	self.drag:set_drag_window(true)
end

BigWindow.addSubMenuLink = function(self,ename)
	local top = self
	self.ctrls["submenu"..ename] = self:get_child("submenu"..ename)
	self.ctrls["submenu"..ename]:set_click(function(self)
		top.hostWindow:showFrame(ename)
	end)
end



BigWindow.MoveFrame = function(self,left,sort,efunc)
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



-- 设置顶层面板
BigWindow.addNavFrame = function(self,fname,func,endfunc)	
	local top = self	
	local pendfunc = endfunc
	local moveframe = self:get_frame(fname,func)	
	if not self.frameMoving and  self.curframe ~= moveframe then
	
		self:layout(true)	
		
		
		--[[
		self.frameMoving = true		
		local sort = table.size(self.mNav)
		moveframe:show2( true, true, 0 )
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
	]]
	
		local sort = table.size(self.mNav)
		if self.curframe then
			--self.curframe:set_style('z-index:1') --('display:none;')
			--self.curframe:layout()
		end
		moveframe:set_style('display:block;z-index:'..tostring(sort*10))
		moveframe:layout()
		self:updatetick(true)
		
																
		self.curframe = moveframe
		self.mNav[sort + 1] = moveframe
		moveframe.level = sort + 1

		if pendfunc then
			pendfunc(moveframe)
		end

		self:printNav("BigWindow.addNavFrame",sort)
		self.frameMoving = false
		self:updatetick(true)

		if moveframe.on_show then
			moveframe:on_show()
		end
																	
		self.frameMoving = false	
					
	end
	
	return moveframe
	
end


-- 移开顶层面板
BigWindow.delTopNavFrame = function(self,fname)	
	local top = self
	local sort = table.size(self.mNav)
	if  not self.frameMoving then 
		self:layout(true)
	
		self.frameMoving = true
		
		if fname == nil then
			print("BigWindow.delTopNavFrame",fname,sort)
			--[[
			self:MoveFrame(false, sort - 1,function(self)
																			if top.curframe then
																				top.curframe:show2(false,false)
																			end
																			top.mNav[sort] = nil	
																			top.curframe = top.mNav[ sort - 1 ]
																			top.curframe:show2(true,true,"0")
																			top:updatetick(true)
																			top:printNav("BigWindow.delTopNavFrame")
																			top.frameMoving = false
																 end)
			]]
			
					
			if self.curframe then
				self.curframe:set_style('display:none;')
			end
			self.mNav[sort] = nil	
			self.curframe = self.mNav[ sort - 1 ]
			self:updatetick(true)
			self:printNav("BigWindow.delTopNavFrame")
			self.frameMoving = false
			sort = sort - 1																			
			return top.mNav[ sort ]
											 
		else
			local frame = self:get_frame(fname)		
			if self.mNav[sort-1] ~= frame then
				self.curframe:set_style('display:none;')
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



-- 直接显示面板
BigWindow.showFrame = function(self,fname,func)

print('showFrame',fname,func)

	local moveframe = self:get_frame(fname,func)
	
	if not self.frameMoving and moveframe ~= nil and self.curframe ~= moveframe then
	
		self:layout()
	
		self.frameMoving = true
		
		
		self:printNav("BigWindow.showFrame")
		
		table.foreach( self.mNav , function(i,v) v:set_style('display:none;') end )
		
		--self.mScrollViewParent:set_style("margin-left:0px;",false)
		
		
		if self.curframe then
			self.curframe:set_style('display:none;')
			self.curframe:layout()
		end
			
		moveframe:set_style('display:block;width:100%;height:100%;')
		moveframe:layout()
		
		self.mNav = {}
		self.mNav[1] = moveframe
		if self.curframe then
			moveframe.level = self.curframe.level
		else
			moveframe.level = 1
		end
		
		self.curframe = moveframe		
		
		self:updatetick(true)
		
		self.frameMoving = false
		
		if moveframe.on_show then
			moveframe:on_show()
		end
				
	end	
	return moveframe
end


-- 显示弹出层
BigWindow.pushFrame = function(self,fname,func)
	local top = self	
	local moveframe = self:get_frame(fname,func)	
	local sort = table.size(self.mNav)		
	moveframe:show2(true,true,( sort - 1 ) * 100)
	self.curframe = moveframe
	self.mNav[sort+1] = moveframe
	moveframe.level = sort+1
	top:updatetick(true)
end

-- 隐藏弹出层
BigWindow.popFrame = function(self)
	local top = self	
	local sort = table.size(self.mNav)
	self.curframe:show2(false,false)
	self.mNav[sort] = nil	
	self.curframe = top.mNav[ sort + 1 ]
	top:updatetick(true)
end


BigWindow.show_popup = function(self,fname,data)
	self.curPop = fname
	self.frame[self.curPop]:set_visible(true)
	self.frame[self.curPop]:set_data(data)
	self.pop:set_style('z-index:3000;display:table-row;')
	self:updatetick(true)
	return self.frame[self.curPop]
end 


BigWindow.hide_popup = function(self)
	self:layout()
	self.pop:set_visible(false)
	self.frame[self.curPop]:set_visible(false)
	self:updatetick(true)
end  
