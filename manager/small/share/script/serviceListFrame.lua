
gr_module("GmManager")

serviceListFrame = inherit(GmBase.FrameBase):name("serviceListFrame")


serviceListFrame.init = function (self,hostWindow,frameid,mainmenu)

	local top = self
	local win = hostWindow
	local fid = frameid or "serviceListFrame"
	GmBase.FrameBase.init(self,hostWindow,fid)


	self.subnav = GmBase.subnavArea(self,nil,"列表")
	self.subnav:set_left("NavTDWidth backNavTD",	function()	
																			top.hostWindow:delTopNavFrame()
																		end)


	self.searcharea = self:get_child("searcharea")
	self.searcharea.content = self.searcharea:get_child("content")
	self.searcharea.visible = false
	self.searcharea.showArea = function(self,bl)
		if not bl then
			if self.visible then
				self:set_visible(false)
				self:updatetick()
				self.visible = false
			end
		else
			if not self.visible then
				self:set_visible(true)
				self:updatetick()
				self.visible = true
			end
		end
	end
	
	self.btsearch = self:get_child("btsearch")
	self.btsearch:set_click(function(button) 
														top.searcharea:showArea(not top.searcharea.visible)
													end)


	self.catogaryctrl = GmBase.categarylistArea(self,false)
	self.catogaryctrl:set_click_func(	function(obj)
																			top:set_inner_data(obj.data)	 
		 										 						end)
		 										 						
	self.listctrl = GmBase.objectdesclistArea(self)

	self.listctrl.datacallback = function(self,a)
		GmCtrl.ListBase.datacallback(self,a)
	end


	
	if mainmenu == true then
		self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
	end
	
	self.clsid = 155
	
	self.searchItem = nil
	
	self.needhidesearch = true

	self.initList = false
	
end


serviceListFrame.hideSearchButton = function(self)
	self.btsearch:set_visible(false)
end


serviceListFrame.hideSearchArea = function(self)
	self.searcharea:showArea(false)
end


serviceListFrame.show_mainmenu = function(self,bl)

end



serviceListFrame.set_data = function(self,data)

	self.data = data	
	-- 类型目录
	self.catogaryctrl:set_data({["id"]="151"})	
	
	self.clsid = self.listctrl:set_clsid(155)
	self:set_inner_data(data)	
	
	-- 是否隐藏搜索
	self:hideSearchButton()		
	self.needhidesearch = true
	

end



serviceListFrame.set_inner_data = function(self,data)
	local tb = {}
	tb.rel = {}
	tb.attr = {}	
	
		
	-- 分类下的
	if self.data.id ~= data.id then -- 这里只发送子节点的id
		
		local reltb = {}
		reltb.childcid = data.clsid
		reltb.childoid = data.id
		reltb.parentcid = self.clsid
		reltb.target = 'parentoid'
		table.insert(tb.rel,reltb)
--		table.print(reltb)
		
	else
		-- todo
		-- 这里需要判断是否父节点，如果是则需要把所有子节点ID送过去。
	end
	
		
	--对象列表
	self.listctrl:set_data(self.clsid,tb)
	self:updatetick()
	
end



serviceListFrame.init_page = function(self)

		local data = {
			["attr"] = {
			    ["39"] = {
						["name"] =  "clsid",
						["valuetype"] =  "1",
						["id"] =  "39",
						["clsid"] =  "155",
						["length"] =  "1",
						["title"] =  "155",
			      }
			  },
			["rel"] = {
			    [ 1 ] =  {
						["relationname"] =  "relationname",
						["id"] =  "3",
						["childcid"] =  "0",
						["childoid"] =  "11",
						["object"] =
						  {
						    ["itemsubtype"] =  "0",
						    ["itemtype"] =  "0",
						    ["title"] =  "充值状态",
						    ["name"] =  "noname",
						    ["parent_id"] =  "0",
						    ["clsid"] =  "0",
						    ["sort"] =  "1",
						    ["id"] =  "11",
						  },
						["parentcid"] =  "0",
						["parentoid"] =  "21",
						["reltype"] =  "4",
						["relsubtype"] =  "1",
			    },
			    [ 0 ] =
			      {
							["relationname"] =  "relationname",
							["id"] =  "4",
							["childcid"] =  "0",
							["childoid"] =  "155",
							["object"] =
							  {
							    ["itemsubtype"] =  "0",
							    ["itemtype"] =  "0",
							    ["title"] =  "话费充值类",
							    ["name"] =  "order",
							    ["parent_id"] =  "1",
							    ["clsid"] =  "0",
							    ["sort"] =  "1",
							    ["id"] =  "155",
							  },
							["parentcid"] =  "0",
							["parentoid"] =  "21",
							["reltype"] =  "7",
							["relsubtype"] =  "2",
			      },
			  },
			["title"] =  "流量订单",
			["clsid"] =  0,
			["name"] =  "objectdesclistFrame",
			["id"] =  "21",
			["parent_id"] =  "4",
			["itemsubtype"] =  "9",
			["itemtype"] =  "1",
			["sort"] =  "2",
    }
		self:set_data(data)	
end

serviceListFrame.show = function(self,a,b,c,d)
	GmBase.FrameBase.show(self,a,b,c,d)
	if self.initList == false and a then
		self.initList = true
		self:init_page()
	end
end