


-- 首页
gr_module("GmManager")

firstFrame = inherit(GmBase.FrameBase):name("firstFrame")

firstFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"firstFrame")
	--aprint("first")
	
	
	self.snav = GmBase.subnavArea(self,nil,"树列表")
	self.snav:set_left_back()
   	
	-- mainnav hehe lua.xslt	 
	
	self.navtitle = self:get_child('navtitleback')
	self.navtitle:set_click(function() 
		table.print(top.levels)
		local idx = table.size(top.levels)
		if idx > 1 then
			top.levels[idx] = nil
			idx = table.size(top.levels)
			top:set_data(top.levels[idx])
		end
		
	end)
   
	self:addJumpLink("treeaddFrame")
  
 	
	-- firstcontent	 
	self.data = { ['id']='0',['parent_id']='0',['itemtype']='0',['name']='',['title']='',}
	self.jumptreeadd2 = self:get_child("jumptreeadd2Frame")
	self.jumptreeadd2:set_click(	function(self)
																local frame = top.hostWindow:addNavFrame("treeaddFrame")
																frame:set_data(top.data)
															end)
  
		

	local urls = {}	
	urls["get"] = g_serverAddress.."tree/objects/page/%d/pagecount/%d/parent_id/%d"
	urls["del"] = g_serverAddress.."tree/delete/id/%d"

	self.listctrl = GmCtrl.ListBase(self,"tree_list",urls)
	
	self.listctrl.trans_data = function(self,data)
		data['sitemtype'] = CONST_TREE_TYPE[ data['itemtype'] ]
		data['sitemsubtype'] = CONST_TREE_SUBTYPE[ data['itemsubtype'] ]		
		return data
	end
	
	self.listctrl.init_item = function(self,item)
		item["deletebt"] = item:get_child("deletebt")
		item["deletebt"]:set_click( function(obj) 
																	--table.print(obj.data)
																	self:delitem(obj.data['id'])
																end	)
		item["updatebt"] = item:get_child("updatebt")
		item["updatebt"]:set_click( function(obj) 
																	--table.print(obj.data)
																	local frame = top.hostWindow:addNavFrame("treeupdateFrame")
																	frame:set_data(obj.data)
																end	)	
		item["addbt"] = item:get_child("addbt")
		item["addbt"]:set_click( function(obj) 
																	--table.print(obj.data)
																	local frame = top.hostWindow:addNavFrame("treeaddFrame")
																	frame:set_data(obj.data)
																end	)	
		item["childbt"] = item:get_child("childbt")
		item["childbt"]:set_click( function(obj) 
																	--top.hostWindow:addNavFrame("treelistFrame",nil,function(frame) frame:set_data(obj.data) end)
																	--table.print(obj.data)
																	top:set_data(obj.data.id)
																end	)	
																
	end

	self.listctrl.setitem = function(self,id,data)
			
		--[[
		    [ "sitemsubtype" ]s = [ "鍩庡競" ]s
        [ "id" ]s = [ "25" ]s
        [ "itemsubtype" ]s = [ "3" ]s
        [ "itemtype" ]s = [ "3" ]s
        [ "title" ]s = [ "鍩庡競" ]s
        [ "sitemtype" ]s = [ "瀵硅薄鍒嗙被" ]s
        [ "name" ]s = [ "city" ]s
        [ "clsid" ]s = [ 0 ]n
        [ "sort" ]s = [ "1" ]s
        [ "parent_id" ]s = [ "0" ]s
		]]
		local item = self.idlist[id]
		item["data"] = data
		item["ctrl"]["deletebt"].data = data
		item["ctrl"]["updatebt"].data = data
		item["ctrl"]["addbt"].data = data
		item["ctrl"]["childbt"].data = data
		
		if item['ctrl'].id == nil then
			item['ctrl'].id = item['ctrl']:get_child('id')
		end
		item['ctrl'].id:set_inner_text(data['id'])
		
		if item['ctrl'].sitemtype == nil then
			item['ctrl'].sitemtype = item['ctrl']:get_child('sitemtype')
		end
		item['ctrl'].sitemtype:set_inner_text(data['sitemtype'])
		
		if item['ctrl'].sitemsubtype == nil then
			item['ctrl'].sitemsubtype = item['ctrl']:get_child('sitemsubtype')
		end
		item['ctrl'].sitemsubtype:set_inner_text(data['sitemsubtype'])
		
		if item['ctrl'].sort == nil then
			item['ctrl'].sort = item['ctrl']:get_child('sort')
		end
		item['ctrl'].sort:set_inner_text(data['sort'])
		
		if item['ctrl'].parent_id == nil then
			item['ctrl'].parent_id = item['ctrl']:get_child('parent_id')
		end
		item['ctrl'].parent_id:set_inner_text(data['parent_id'])
		
		if item['ctrl'].title == nil then
			item['ctrl'].title = item['ctrl']:get_child('title')
		end
		item['ctrl'].title:set_inner_text(data['title'])
		
		if item['ctrl'].txtname == nil then
			item['ctrl'].txtname = item['ctrl']:get_child('txtname')
		end
		item['ctrl'].txtname:set_inner_text(data['name'])
		
		return item
	end

			
	self.levels = {}
		
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
  
  self:set_data(0)
 
end
  

firstFrame.set_data = function(self,pid)
	if tonumber(pid) == 0 then
		self.levels = {}
	end
	local l = table.size(self.levels)
	
	-- 这里必须判断上一级是否为PID，页面返回上一级两次时候会重复插入
	if self.levels[l]  ~= pid then
		self.levels[l+1] =  pid
	end
	
	
	self.listctrl:clear()
	self.listctrl:set_data(pid)
end
  
