
-- 小型窗口基类，一般用于移动手机
gr_module("GmBase")

SmallWindow = inherit(GmBase.Window):name("SmallWindow")


SmallWindow.init = function (self,html)

	local top = self
	local win = self
	
	GmBase.Window.init(self,html)
	
	self.popmanager = GmBase.Pop(self.body)

	
	self.frameMoving = false
	
	self.topMainScroll = self.body:get_child('topmainscroll')
	self.topMainScroll:layout()
		
	
end


SmallWindow.addSubArea = function(self,moveframe)
	for key ,value in pairs(moveframe.subareas) do
		local area = self:make_area(self,key)
		if area then
			self.areas[key]:move_to( moveframe.subareas[key][0] )
			self.areas[key]:set_visible(true)
		else
			print("(SmallWindow.addSubArea) 5 has not area",key)
		end
	end
end


SmallWindow.MoveFrame = function(self,left,sort,efunc)
	local top = self
	local _,_,winW,winH , _,_,_,_, _,_,_,_ = self.topMainScroll:get_size()
	local dd = 6
	if left then
		self.topMainScroll:run_scroll_pos(dd,winW,0,false,efunc or function() top.topMainScroll:layout() end)
	else
		self.topMainScroll:run_scroll_pos(dd,-winW,0,false,efunc or function() top.topMainScroll:layout() end)
	end
end



SmallWindow.showFrame = function(self,fname,func)

	self:layout()
	
	local _c1,_c2,winW,winH , _c3,_c4,_c5,_c6, _c7,_c8,_c9,_c0 = self.topMainScroll:get_size()
	--print("SmallWindow.showFrame topMainScroll size  ",_c1,_c2,winW,winH , _c3,_c4,_c5,_c6, _c7,_c8,_c9,_c0)
		
	if self.frameMoving or winW == 0 then
		print("SmallWindow.showFrame frameMoving error ",winW,winH)
		return
	end
	
	local top = self
	local moveframe = self:get_frame(fname,func)
	
	if not self.frameMoving and moveframe ~= nil and self.curframe ~= moveframe then	
	
	
		self:showActionMask(true)
		
		self.frameMoving = true
		
		self:hideAllPlugin()
		
		local sort = table.size(self.mNav)
		
		local lastframe = self.curframe
		
		local level = 1
		
		if lastframe ~= nil and lastframe.show and lastframe.on_hide then
			level = lastframe.level
			
			
											
											
			lastframe:show(false,false)
			
			--print('lastframe.on_hide,lastframe,3')
			
			local status,err = pcall(lastframe.on_hide,lastframe,3)
			if not status then
			    local code = err.code and tonumber(err.code) or 500
			    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
			    print('SmallWindow.showFrame on_hide ERROR',code,msg )
			end	
					
		end
		
		self.curframe = moveframe
		self.mNav[level] = moveframe
		
		moveframe.level = level
		
		self.topMainScroll:set_scroll_pos(winW * level,0)
		
		
		moveframe:show(true,true,( level * 100 ))
		
		--print('moveframe.on_show,moveframe,3')
		
		local status,err = pcall(moveframe.on_show,moveframe,3)
		if not status then
		    local code = err.code and tonumber(err.code) or 500
		    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
		    print('SmallWindow.showFrame on_show ERROR',code,msg )
		end	
		
		self.frameMoving = false
		
		self:showActionMask(false)
		
		self:layout()
		
		self:updatetick(true)
		
		self:printNav("showFrame")
		
										
	end
	
	return moveframe
	
end


SmallWindow.addNavFrame = function(self,fname,func,endfunc)
	local top = self
								
	if self.frameMoving then
		print("SmallWindow.addNavFrame frameMoving error ")
		return
	end
	
	local moveframe = self:get_frame(fname,func)
	local lastframe = self.curframe
	
	if not self.frameMoving and moveframe and self.curframe ~= moveframe then
	
		self.frameMoving = true
		
		self:showActionMask(true)
		
		moveframe.name = fname
										
		if lastframe then
			
			--print('lastframe.on_hide,lastframe,1')
			lastframe:on_hide(1)
		end	
		
		local sort = table.size(self.mNav)	
		local newsort = sort + 1
		moveframe:set_parent(self.mScrollViewParent)
		moveframe:show(true,true,( newsort * 100 ))
		moveframe:init_mainmenu(false)
		self:layout()

		self:MoveFrame( true, newsort ,	function(self)		
										top:showActionMask(false)										
										top.curframe = moveframe
										top.mNav[newsort] = moveframe
										moveframe.level = newsort	
										
										top.frameMoving = false			
																	
										top:printNav("addNavFrame")
													
										if endfunc ~= nil then
											local status,err = pcall(endfunc,moveframe)	
											if not status then
											    local code = err.code and tonumber(err.code) or 500
											    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
											    cerror('ERROR addNavFrame endfunc ',endfunc, code, msg )
											end	
										end
										
		
										--print('moveframe.on_show,moveframe,1')
		
										if moveframe and moveframe.on_show then
											local status,err = pcall(moveframe.on_show,moveframe,1) -- 把整个脚本当作函数来执行	
											if not status then
											    local code = err.code and tonumber(err.code) or 500
											    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
											    cerror('ERROR moveframe addNavFrame on_show ',code,msg )
											end	
										end	
		
										top:layout()
										
										top:updatetick(true)		
										
									end)
									
	end
	
	return moveframe
end




SmallWindow.delTopNavFrame = function(self,fname,endfunc,endfunc2)

	local _,_,winW,winH , _,_,_,_, _,_,_,_ = self.topMainScroll:get_size()
	local top = self
	local sort = table.size(self.mNav)
	local newsort = sort - 1
											
	if self.frameMoving then
		print("SmallWindow.delTopNavFrame error ")
		return
	end
						
	if not self.frameMoving and sort >= 2 then
	
		self.frameMoving = true
		self:showActionMask(true)
		self:hideAllPlugin()
		
		local moveframe = self.mNav[ newsort ]
		local lastframe = self.curframe
		
		if moveframe then
		
			if fname == nil then	
			
				if moveframe then

					--print("************************************************************* 0",winW,winH)
					
					self.topMainScroll:set_scroll_pos(sort * winW,0)
					
					local a,b,c,d = self.topMainScroll:get_scroll_pos()

					moveframe.level = newsort
				
					moveframe:show(true, true,( ( moveframe.level ) * 100 ))

																					
					if lastframe then
						--print('lastframe.on_hide,lastframe,2')
						lastframe:on_hide(2)
					end
																					
					self:MoveFrame(false, moveframe.level , function(self)
					
																					if endfunc ~= nil then
																						endfunc(lastframe)
																					end
																					
																					
																					top:showActionMask(false)
																					top.frameMoving = false
																					
																					
																					top.mNav[sort] = nil	
																					
																					top.curframe = top.mNav[ newsort ]	
																					
																					
					
																					if endfunc2 ~= nil then
																						endfunc2(moveframe)
																					end
																					
																					if moveframe and moveframe.on_show then
																					
																						--print('moveframe.on_show,moveframe,2')
																						
																						local status,err = pcall(moveframe.on_show,moveframe,2) -- 把整个脚本当作函数来执行	
																						if not status then
																						    local code = err.code and tonumber(err.code) or 500
																						    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
																						    cerror('ERROR uppushFrame on_show ',code,msg )
																						end	
																					end	
																					
																					top:layout()
																					
																					top:updatetick(true)
																					
																					top:printNav("delTopNavFrame 1")
																					
										
																		 end)
				else
					print('SmallWindow.delTopNavFrame error 1')
				end
														 
			else -- if fname ~= nil then	
			
			
				--self:printNav(fname)
				
				local frame = self:get_frame(fname)		
				
				if self.mNav[newsort] ~= frame then
				
					--print("delFrame",frame.framename)
				
					self.curframe:show(false,false)
					
					self.mNav[sort] = nil
					
					self.curframe = self.mNav[newsort]	
					
					self.frameMoving = false
					
					top:printNav("delTopNavFrame 2")
										
					self:delTopNavFrame(fname,endfunc,endfunc2)
					
				else
					
					self.frameMoving = false
					
					top:printNav("delTopNavFrame 3")
					
					self:delTopNavFrame(nil,endfunc,endfunc2)
					
										
				end --if self.mNav[newsort] ~= frame then
				
			end -- if fname == nil then	
			
		else
		
			print('SmallWindow.delTopNavFrame error 3')
			
		end -- if moveframe then
		
	else
	
		print('SmallWindow.delTopNavFrame error',sort,fname,endfunc,endfunc2)
		
		self:showActionMask(false)
		self.frameMoving = false
		
		top:printNav("delTopNavFrame 4")
										
	end	-- if not self.frameMoving and sort >= 2 then	
										
end




SmallWindow.uppushFrame = function(self,fname,endfunc)
	if self.frameMoving then
		print("SmallWindow.uppushFrame frameMoving error ")
		return
	end
	
	local _,_,winW,winH , _,_,_,_, _,_,_,_ = self.topMainScroll:get_size()
	local top = self
								
	local moveframe = self:get_frame(fname)
	local lastframe = self.curframe
	
	if not self.frameMoving and moveframe and self.curframe ~= moveframe then
	
		self.frameMoving = true
		
		self:showActionMask(true)
		
		moveframe.name = fname
		
		local sort = table.size(self.mNav)	
		local newsort = sort + 1
		moveframe:set_parent(self.mScrollViewParent)
		
		moveframe:init_mainmenu(false)

		moveframe:animation(75, 0, 25, "position:absolute;top:%d%%;margin-left:" ..tostring( sort * 100 ).. "%%;z-index:"..tostring(newsort*100),function()	
		
										top.frameMoving = false	
										top:showActionMask(false)	
										moveframe.level = newsort		
																
										if endfunc ~= nil then
											endfunc(moveframe)
										end								
																	
										if moveframe and moveframe.on_show then
										
											--print('moveframe.on_show,moveframe,1')
											
											local status,err = pcall(moveframe.on_show,moveframe,1) -- 把整个脚本当作函数来执行	
											if not status then
											    local code = err.code and tonumber(err.code) or 500
											    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
											    cerror('ERROR uppushFrame on_show ',code,msg )
											end	
										end	
																		
										if lastframe and moveframe.on_hide then
											
											--print('lastframe.on_hide,lastframe,1')
											lastframe:on_hide(1)				
											local status,err = pcall(lastframe.on_hide,lastframe,1) -- 把整个脚本当作函数来执行	
											if not status then
											    local code = err.code and tonumber(err.code) or 500
											    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
											    cerror('ERROR uppushFrame on_hide ',code,msg )
											end	
										end
										
										top.curframe = moveframe
										top.mNav[newsort] = moveframe
										
										moveframe:show(true,true, newsort * 100 )
										top.topMainScroll:set_scroll_pos( newsort * winW, 0, true)
										
										--top:updatetick(true)	
										
										top:printNav("uppushFrame")
									end)
									
	end
	
	return moveframe
	
end



SmallWindow.uppopFrame = function(self,endfunc)
	local top = self
	
	if self.frameMoving then
		print("SmallWindow.uppopFrame frameMoving error ")
	end

	local _,_,winW,winH , _,_,_,_, _,_,_,_ = self.topMainScroll:get_size()
	self:showActionMask(true)
	self.frameMoving = true
	
	
	local sort = table.size(self.mNav)	
	local newsort = sort - 1
	local lastframe = self.mNav[newsort]
	
	lastframe:show(true,true,( newsort * 100 ))
	self.curframe:show(true,true,( newsort * 100 ))
	self.topMainScroll:set_scroll_pos( newsort * winW, 0, false)
										
	self.curframe:animation( 0, 100, 25, "position:absolute;top:%d%%;margin-left:" ..tostring( newsort * 100 ).. "%%;z-index:"..tostring(sort*100),function() 	
	
		top:showActionMask(false)
		top.frameMoving = false
		
		--print('lastframe.on_hide,lastframe,4')
		top.curframe:on_hide(4)
		top.curframe:show(false,false)
		
		top:layout()
		top:updatetick()
						
		if endfunc ~=nil then
			endfunc(top.curframe,lastframe)
		end	
		
		top.curframe = lastframe
		top.mNav[sort] = nil

		top:printNav("uppopFrame")
		
		--print("SmallWindow.popFrame end")
	end)
	
	
end


SmallWindow.pushFrame = function(self,fname,func)
	local top = self
	
	self.frameMoving = true
	self:showActionMask(true)
	
	local level = self.curframe.level
	
	self.curMaskFrame = self:get_frame(fname,func)
	if self.curMaskFrame then
		local style = string.format("position:absolute;margin-left:%d%%;top:0px;z-index:3000;",level * 100)
		self.curMaskFrame:set_style(style)
	else
		print('pushFrame '..fname..' error!!!!!!!!!!!')
	end
	
	--print('moveframe.on_show,moveframe,4')
	
	self.curMaskFrame:on_show(4)
	
	self:showActionMask(false)
	self.frameMoving = false
	self:updatetick()
	
	return self.curMaskFrame
end


SmallWindow.popFrame = function(self)

	self:showActionMask(true)
	self.frameMoving = true

	self.curMaskFrame:set_style("display:none")

	self.curMaskFrame:on_hide(4)
	
	self:showActionMask(false)
	self.frameMoving = false
	
	self:updatetick()
end



SmallWindow.popup = function(self,fname)
	local top = self	
	self.frameMoving = true
	local moveframe = self:get_frame(fname)		
	moveframe:set_style("position:absolute;display:block;left:0px;top:0px;z-index:2000;width:100%;height:100%;text-align:center;")
	self.frameMoving = false
	return moveframe
end
