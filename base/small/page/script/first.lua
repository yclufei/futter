

-- 首页，这只是个框架，内容是 firstarea
gr_module("GmBase")

firstFrame = inherit(GmBase.FrameBase):name("firstFrame")

firstFrame.init = function (self,hostWindow,frameid)

	local top = self
	local win = hostWindow
	
	local fid = frameid or "templete_firstFrame"
	GmBase.FrameBase.init(self,hostWindow,fid)
	
	self.scrollcontainer = self:get_child("scrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
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
	------------------------------------------------------------------------------------- tree_list
	
	self.firstarea = GmBase.firstArea(self,false)
	self.firstarea:set_visible(true)
	
	self.subareas["initmainmenu"] = self:get_child("subareamainmenu")

end

firstFrame.hideBackButton = function(self)
	self.subnav:set_left()
end

firstFrame.set_data = function(self,_)
	local data = {}
	data['id'] = '23'
	data['title'] = '我的'
	self.subnav:set_title(data['title']) -- 标题
	self.firstarea:set_data(data)
	self.scrollcontainer:set_scroll_pos(-1,110 * gInfo['retina'],true)
end
