
-- 帖子列表
gr_module("GmBase")

objectlistFrame = inherit(GmBase.FrameBase):name("objectlistFrame")

objectlistFrame.init = function (self,hostWindow,frameid,mainmenu)

	local top = self
	local win = hostWindow
	local fid = frameid or "templete_objectlistFrame"
	
	GmBase.FrameBase.init(self,hostWindow,fid)

	self.subnav = GmBase.subnavArea(self,nil,"消息")
	self.subnav:set_left("NavTDWidth backNavTD",	function()	
																			top.hostWindow:delTopNavFrame()
																		end)
																		--[[
	self.subnav:set_right("NavTDWidth searchNavTD",function(self)
																				local frame = top.hostWindow:popup("objectsearchFrame")
																				frame:set_clsid(top.listctrl.clsid)
																				frame:set_data(top.data)
																			end)
																			]]
				



	-- 列表
	self.listctrl = GmBase.objectdesclistArea(self)

	
	-- 是否显示主菜单
	if mainmenu == true then
		self.subareas["initmainmenu"] = self:get_child("subareamainmenu")
	end
	
end
 
 
 
objectlistFrame.show_mainmenu = function(self,bl)
--	print("todo objectlistFrame.show_mainmenu")
end


objectlistFrame.hideBackButton = function(self)
	self.subnav:set_left()
end

-- 设置跳转时的初始数据
objectlistFrame.set_data = function(self,data)

	self.clsid = self.listctrl:set_tree_rel_clsid(data)
	return self:set_inner_data(data)
end



-- 设置下拉选择是的数据
objectlistFrame.set_inner_data = function(self,data)
	self.data = data
	local url = self.listctrl:set_data(data["id"])
	
	--对象列表
	if self.clsid ~= -1 then
		url = self.listctrl:set_data(self.clsid)
	else
		url = self.listctrl:set_data(data["id"])
	end
		
	self.subnav:set_title(data.title) -- 标题
	self:updatetick()
	return url
end
