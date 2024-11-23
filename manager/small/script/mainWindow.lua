
gr_module("GmManager")

ClientWindow = inherit(GmBase.SmallWindow):name("ClientWindow")


ClientWindow.init = function (self)

	local top = self
	local win = self
	
	GmBase.SmallWindow.init(self,"manager/small/html/main.html")
	
	-- 获取类定义数据
	local url = g_serverAddress.."tree/get_class_define"
	self.mScrollViewParent:curl( url,	function(a)
																local data = a['data']						
																for a,b in pairs(data) do
																	gApp:add_class_define(b)	
																end
															end)

	-- 获取栏目数据
	local url = g_serverAddress.."tree/get_columns"
	self.mScrollViewParent:curl( url,	function(a)
																local data = a['data']								
																for a,b in pairs(data) do
																	gApp:add_column(b)	
																end
															end)

	-- 搜索面板模板
	self:addSearchPanelTemplete(121,self:get_child('searchpanel_phoneorder'),GmControl.PhoneOrderSearchPanel)
	self:addSearchPanelTemplete(134,self:get_child('searchpanel_accountdetail'),GmControl.AccountDetailSearchPanel)
	
	
	-- 列表item模板
	self:addListItemTemplete(121,self:get_child('listitem_phoneorder'),GmControl.PhoneOrderListItem)
	self:addListItemTemplete(134,self:get_child('listitem_accountdetail'),GmControl.AccountDetailListItem)
	self:addListItemTemplete(138,self:get_child('listitem_collect'),GmControl.CollectListItem)
	self:addListItemTemplete(147,self:get_child('listitem_msg'),GmControl.MsgItem)
	self:addListItemTemplete(19 ,self:get_child('listitem_myproduct'),GmControl.myProductItem)


	-- 方块模板
	self:addAreaTemplete("advmulbig",GmBase.advmulBigArea)	
	self:addAreaTemplete("ctrldroplist",GmControl.DropList)	
	self:addAreaTemplete("categarylistpagebig",GmBase.categarylistpageBigArea)
	self:addAreaTemplete("categarylistpagemiddle",GmBase.categarylistpageMiddleArea)
	self:addAreaTemplete("categarylistpagesmall",GmBase.categarylistpageSmallArea)	
	self:addAreaTemplete("categarylistbig",GmBase.categarylistBigArea)
	self:addAreaTemplete("categarylistmiddle",GmBase.categarylistMiddleArea)
	self:addAreaTemplete("categarylistsmall",GmBase.categarylistSmallArea)	
	self:addAreaTemplete("firstarea",GmBase.firstArea)
	self:addAreaTemplete("threeobjectdescconciseleft",GmBase.threeobjectdescconciseLeftArea)
	self:addAreaTemplete("threeobjectdescconciseright",GmBase.threeobjectdescconciseRightArea)
	self:addAreaTemplete("ursconcise",GmBase.ursconciseArea)
	self:addAreaTemplete("urslist",GmBase.urslistArea)
	self:addAreaTemplete("weather",GmBase.weatherArea)
	self:addAreaTemplete("mainmenu",GmBase.mainmenuArea)
	self:addAreaTemplete("simplelistitem",GmBase.simplelistitemArea)
	self:init_area("mainmenu")
	
	
	-- 系统预定义页面模板
	self:addFrameTemplete("objectdesclistFrame",GmBase.objectdesclistFrame)
	self:addFrameTemplete("objectdescmulsellistFrame",GmBase.objectdescmulsellistFrame)	
	self:addFrameTemplete("objectcategoryFrame",GmBase.objectcategoryFrame)
	self:addFrameTemplete("firstFrame",GmBase.firstFrame)
	self:addFrameTemplete("objectpublicFrame",GmBase.objectpublicFrame)
	

	self:addFrameTemplete("modifyPwdFrame",GmBase.modifyPwdFrame)
	self:addFrameTemplete("objectlistFrame",GmBase.objectlistFrame)
	self:addFrameTemplete("ursinfoFrame",GmBase.ursinfoFrame)
	self:addFrameTemplete("urscenterFrame",GmBase.urscenterFrame)
	self:addFrameTemplete("aboutFrame",GmBase.aboutFrame)
	self:addFrameTemplete("feedbackFrame",GmBase.feedbackFrame)
	self:addFrameTemplete("objectsearchFrame",GmBase.objectsearchFrame)	
	self:addFrameTemplete("objectdetailFrame",GmBase.objectdetailFrame)
	self:addFrameTemplete("updateFrame",GmBase.updateFrame)
	self:addFrameTemplete("registerFrame",GmBase.registerFrame)	
	self:addFrameTemplete("protocalFrame",GmBase.protocalFrame)
	self:addFrameTemplete("settingFrame",GmBase.settingFrame)	
	self:addFrameTemplete("forgetPwdFrame",GmBase.forgetpwdFrame)
	self:addFrameTemplete("loginFrame",GmBase.loginFrame)
	self:addFrameTemplete("otherappFrame",GmBase.otherappFrame)
	self:addFrameTemplete("objectupdateFrame",GmBase.objectupdateFrame)
	self:addFrameTemplete("orderFrame",GmManager.orderFrame)

	
	-- 项目模板
	self.frame['startFrame'] = GmManager.startFrame(self)
	self.frame['ecgFrame'] = GmManager.ecgFrame(self)
	self.frame['ecgresultFrame'] = GmManager.ecgresultFrame(self)
	
	self.frame['productdetailFrame'] = GmManager.productdetailFrame(self)
	self.frame['serviceDetailFrame'] = GmManager.serviceDetailFrame(self)
	self.frame['serviceListFrame'] = GmManager.serviceListFrame(self)	
	self.frame['addAddrFrame'] = GmManager.addAddrFrame(self)
	self.frame['addServiceFrame'] = GmManager.addServiceFrame(self)
	
	if gInfo["os"] == "win" then
		self:set_pos(760,5)
		self:set_size(512,800)
	end
	
	self.firstData = nil
	
	local frame = self:make_frame("aboutFrame","aboutFrame")
	if frame and frame.subnav then
		frame.subnav:set_left("NavTDWidth backNavTD",function() top:delTopNavFrame() end)
	end
	
	frame = self:make_frame("urscenterFrame","urscenterFrame")
	if frame and frame.subnav then
		frame.subnav:set_left("NavTDWidth backNavTD",function() top:delTopNavFrame() end)
	end
	
	frame = self:make_frame("modifyPwdFrame","modifyPwdFrame")
	if frame and frame.subnav then
		frame.subnav:set_left("NavTDWidth backNavTD",function() top:delTopNavFrame() end)
	end
	
	
	frame = self:make_frame("registerFrame","registerFrame")
	if frame and frame.subnav then
		frame.subnav:set_left("NavTDWidth backNavTD",function() top:delTopNavFrame() end)
	end
	
	
	frame = self:make_frame("forgetPwdFrame","forgetPwdFrame")
	if frame and frame.subnav then
		frame.subnav:set_left("NavTDWidth backNavTD",function() top:delTopNavFrame() end)
	end

	
	
	self:set_visible(true)
	
	
	self:addNavFrame("loginFrame")
	self:showActionMask(false)
		
end   


ClientWindow.on_command = function(self,data)
--	table.print(data)
	local top = self
	if self:has_frame(data.name) then
		local frame = self:addNavFrame(data.name)
	elseif data.name == 'quit' then
	
	end
end


ClientWindow.initFirst = function(self,data)
	if self.firstData == nil then
		-- 首页
		local fname = "frame"..data.id
--		print(data['name'],fname,data['name'])
		local f = self:make_frame(fname,data['name'],true)
		if f and f.hideBackButton then
			f:hideBackButton()	
		end		
		f:init_mainmenu(true)
		if f.set_data then
			f:set_data(data)
		end		
		self:showFrame(fname)		
		self.firstData = data		
	end
end



