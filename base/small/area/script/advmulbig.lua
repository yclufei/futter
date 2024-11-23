
gr_module("GmBase")

advmulBigArea = inherit(GmCtrl.ControlBase):name("advmulBigArea")

advmulBigArea.init = function(self,parent,fname,w,h)

	local top = self
	self.parent = parent
	local fid = fname or "advmulbigArea"
	
	GmCtrl.ControlBase.init(self,parent,fid)
	
	self.timedis = 2
	
			
	self.screenWidth = w or gInfo[ "screenwidth" ] -- 滚动条宽度
	self.screenHeight = h or gInfo[ "screenwidth" ] / 2 -- 滚动条宽度
	
	self.height = self.screenHeight
	
	self.slidingWidth = 0 
	
	-- 显示列表
	self.scrollcontainer = self:get_child("scrolllist2")
	
	self.scrollcontent = self.scrollcontainer:get_child("scrollcontent")
	self.scrollcontent:set_style("height:"..tostring(self.height).."px")
	
	self.scrollitem = self:get_child("scrollitem")

	self.scrollcontainer.on_timeout = function(container)
		--print("------------##############################################- advmulBigArea on_timeout",top.scrollcontent:has_render())
		local ttop = top
		if top:has_render() then
			local a,b,c,d = container:get_scroll_pos()
			local step = top.step + 1
			if step > 3 then
				step = 1
			end
			top.stepoint[top.step]:set_style("background-position:0px 0px;display:inline-block;")
			top.step = step
			top.stepoint[top.step]:set_style("background-position:0px -10px;display:inline-block;")
			top.parent:updatetick(true)
			container:run_scroll_pos(1,self.screenWidth,0,false,function() ttop.parent:layout() end)
			if ( top.itemcount - 1 ) * self.screenWidth == c then
				container:set_scroll_pos_msg(0,0,true)
			end
			container:set_timeout(top.timedis)
		else
			top.parent:layout()
			container:set_timeout(top.timedis * 5)
		end
		
	end	
	
	self.step = 1	
	self.stepsign = self:get_child("stepsign")
	self.stepoint = {}	
	
	self.itemcount = 0
	
	self.on_scroll_end = function(x,y,w,h)
		if top.step == 1 then
			--print('----------------------------------- advmulBigArea on_scroll_end',x,y,w,h)
			top.scrollcontainer:set_scroll_pos(0,0,true)
			top.parent:layout()
			top.step = 1
		end
	end
	
	self.timer_func = function()
		local container = top.scrollcontainer
		if top:has_render() then
			local a,b,c,d = container:get_scroll_pos()
			
			local laststep = top.step % top.itemcount
			
			top.stepoint[laststep]:set_style("background-position:0px 0px;display:inline-block;")
			
			top.step = top.step + 1
			
			if top.step == top.itemcount then
				top.step = 1
			end
			
			local pos = top.step % top.itemcount

			top.stepoint[pos]:set_style("background-position:0px -10px;display:inline-block;")
			top:updatetick()
			
			container:run_scroll_pos(10,self.screenWidth ,0,true,top.on_scroll_end)
			
		else
			--print("advmulBigArea timer_func has not render")
		end
		return false
	end
	
	self.timer = set_timer(10000,1000000,self.timer_func)
	
	--print('----------------------------------- advmulBigArea 4')
	
	
	self:set_style("width:"..tostring(self.screenWidth).."px;")
	self.scrollcontainer:set_style("width:"..tostring(self.screenWidth).."px;")
	
end


advmulBigArea.init_pos = function(self)
	--self.scrollcontainer:set_scroll_pos( 0 , -1, true )
end

advmulBigArea.set_height = function(self,h)
--[[	]]
	self.height = tonumber(h)
	self:set_style("width:"..tostring(self.screenWidth).."px;")
	self.scrollcontainer:set_style("width:"..tostring(self.screenWidth).."px;height:"..tostring(self.height).."px")

end


advmulBigArea.additem = function(self,data)
	
	--table.print(data)
	
	local top = self
		
	if self.screenWidth == nil or self.screenWidth == 0 then
		print('advmulBigArea.additem ERROR:',self.screenWidth)
	end
	
	local ctrlkey = "advmulBigArea"..tostring( data['id'] )
	local itemctrl = self.scrollcontent:get_ctrl(ctrlkey)
	if itemctrl ~= nil then
		itemctrl.data = data
		if data['imgsrc'] then
			local uri = g_serverRoot..'qs2/data/upload/ads/'..data['imgsrc']
			local style = "background:url("..uri..");width:"..tostring(self.screenWidth).."px;height:"..tostring(self.height).."px;"
			itemctrl.style = style
			itemctrl:set_style(style)
		end	
	else
		local itemctrl = self.scrollitem:copy()
		itemctrl.data = data
		
		local c = self.scrollcontent:add_ctrl("advmulBigArea"..tostring( data['id'] ),itemctrl)
		
		local totalwidth = c * self.screenWidth
		self.scrollcontainer.totalwidth = totalwidth
		
		local s = "width:"..tostring(totalwidth).."px"
		self.scrollcontent:set_style(s)	

		
		if data['imgsrc'] then
			local uri = g_serverRoot..'qs2/data/upload/ads/'..data['imgsrc']
			local pos,len = string.find(data['imgsrc'],'http')
			if pos ~= nil then
				uri = data['imgsrc']
			end
			local style = "background:url("..uri..");width:"..tostring(self.screenWidth).."px;height:"..tostring(self.height).."px"
			itemctrl.style = style
			itemctrl:set_style(style)
		end
		
		itemctrl:set_click( function(ctrl) top:on_select(ctrl.data) end)
												
		if c > 1 then
			self.stepoint[c-1] = self.stepsign:get_child("st"..tostring(c))
			self.stepoint[c-1]:set_style("background-position:0px 0px;display:inline-block;")
		end	
		
		self.itemcount = c	
	end
	
end


	


advmulBigArea.set_data = function(self,data)
	if data then
		local len = table.size(data)
		local firstdata = nil
		for a,b in pairs(data) do
			if firstdata == nil then
				firstdata = b
			end
			self:additem(b)
		end
		if firstdata then
			firstdata['id'] = 'first'
			self:additem(firstdata)
		end
		self:init_pos()	
		if self.stepoint[1] == nil then
			self.stepoint[1] = self.stepsign:get_child("st1")
		end
		self.stepoint[1]:set_style("background-position:0px -10px;display:inline-block;")
		self.step = 1
	end
end


advmulBigArea.stop = function(self)
	print("advmulBigArea stop")
	--self.scrollcontainer:remove_timeout()
	--self.scrollcontainer:set_scroll_pos( 0 , 0 )
end


advmulBigArea.start = function(self)
	print("advmulBigArea start")
	--self.scrollcontainer:set_scroll_pos( 0 , 0 )
	--self.scrollcontainer:set_timeout(self.timedis)
end


advmulBigArea.callback = function(self,callbackey,tbname,postparam,data)
	local selfdata = true
	local attrs = self:GetAttrs()
	for k,v in pairs(attrs) do
		if postparam[k] ~= v then
			return false
		end
	end
	local dbsql = self:GetDBWhereChildSql()
	self:init_item_data(self.tablename ," where "..dbsql , "  order by show_order desc ",0,3)
	return true
end

