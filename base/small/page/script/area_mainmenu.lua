-- 底部主菜单类 	

gr_module("GmBase")

mainmenuArea = inherit(GmBase.FrameBase):name("mainmenuArea")

mainmenuArea.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "mainmenuArea"
	GmBase.FrameBase.init(self,parent.hostWindow,fid)
	
	--------------------------------------------------------------------------

	self.items = {}
	self.firstLink = self:get_child('jumpfirstFrame')
	
	self.curLink = nil

	self.data = nil
	
	function GSortMyIndex4(a,b)
		return tonumber(top.data[tostring(a)].sort) < tonumber(top.data[tostring(b)].sort);
	end		


	-- todo 再次登录时出错
	self.ssnewfunc = function(curl)	
		local data = curl
		--table.print(data)
		if data and data['success'] then		
			top.data = data['data']
			local itemcount = table.size(data['data'])
			for a,b in GSortedPairs(data['data'],GSortMyIndex4) do
				top.items[a] = top.firstLink:copy()
				top.items[a]:set_parent(top)
				top.items[a]:set_inner_text(b['title'])
				top.items[a].data = b
				top.items[a]:set_style("background-image:url(trafficweb/small/client/html/images/tab_"..b['sort'].."_a.png);width:"..tostring(100/itemcount).."%;")
				-- 设置当前选择连接
				if top.curLink == nil then
					top.curLink = top.items[a]
					top.curLink:set_class("mainMenuItem2")
					if top.hostWindow.initFirst then
						top.hostWindow:initFirst(b)
					end
				end
				--菜单按钮点击事件
				top.items[a]:set_click(	function(self)
													local framename = "frame"..self.data['id']
													ftempletename = self.data['name']
													-- 设置样式
													print("menu click 1")
													top.curLink:set_class("mainMenuItem")
													self:set_class("mainMenuItem2")													
													top.curLink = self
													print("menu click 2","frame"..self.data['id'])
													local frame = top.hostWindow:showFrame("frame"..self.data['id'],function(win)
													print("menu click 2 2 1",framename,ftempletename)
																																														local frame = win:make_frame(framename,ftempletename,true)
													print("menu click 2 2 2",frame,frame.set_data)
																																														if frame and frame.set_data then
																																															frame:set_data(self.data)	
																																														end
													print("menu click 2 2 2")
--																																													print("###################### AAAAAAAAAAAAAAAAAASSSSSSSSSSSSS")
																																														if frame and frame.hideBackButton then
																																															frame:hideBackButton()	
																																														end		
													print("menu click 2 2 3")																																												
																																														return frame
																																													end)	
													print("menu click 2 2")
													frame:init_mainmenu(true)	
													print("menu click 3")
													if frame and frame.hideBackButton then
														frame:hideBackButton()	
													end			
													print("menu click 4")
													top:updatetick()									
												end)											
			end
		end
		self:updatetick()
	end

end


mainmenuArea.init_data = function(self,data)
	self.tmpurl = g_serverAddress.."tree/objects/page/%d/pagecount/%d/withattr/1/withrel/1/parent_id/4"
	print(self.tmpurl)
	local url = string.format( self.tmpurl ,1 , 100 )
	self:curl(url,self.ssnewfunc)
	self:set_visible(true)
end


mainmenuArea.addShowLink = function(self,ename)
	local top = self
	self.ctrls["jump"..ename] = self:get_child("jump"..ename)
	self.ctrls["jump"..ename]:set_click(function(self)
																				if top.curLink ~= self then
																					if top.curLink ~= nil then
																						top.curLink:set_attr("class","mainMenuItem")
																					end
																					self:set_attr("class","mainMenuItem2")
																					top.hostWindow:showFrame(ename)
																					top.curLink = self
																				end
																			end)
	return self.ctrls["jump"..ename]																			
end

  
