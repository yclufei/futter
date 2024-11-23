
-- 帖子详情
gr_module("GmManager")

productdetailFrame = inherit(GmBase.FrameBase):name("productdetailFrame")

productdetailFrame.init = function (self,hostWindow)
	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_productdetailFrame")
	------------------------------------------------------------------------
	
	self.scrollcontainer = self:get_child("scrolllist")
	
	------------------------------------------------------------------------
	self.subnav = GmBase.subnavArea(self,nil,"对象详情33")
	self.subnav:set_left("NavTDWidth backNavTD",	function()	
																			top.hostWindow:delTopNavFrame()
																		end)
	----------------------------------------------------------------
	
	self.advmul = self:get_child("advmul")
	
	self.advarea = self.hostWindow:make_area(self.advmul,"product","advmulbig")
	
	
	self.advarea:set_visible(true)
	local data =	{
									['object'] = {
												[1] =	{
														['id'] = '1',
														['objecttitle'] = '11111',
														['attr'] = { ['imgsrc'] = { ['attrvalue'] = 'testimages/bb.jpg' } }
													},
												[2] =	{
														['id'] = '2',
														['objecttitle'] = '22222',
														['attr'] = { ['imgsrc'] = { ['attrvalue'] = 'testimages/bb.jpg' } }
													},
												[3] =	{
														['id'] = '3',
														['objecttitle'] = '33333',
														['attr'] = { ['imgsrc'] = { ['attrvalue'] = 'testimages/bb.jpg' } }
													},
												[4] =	{
														['id'] = '4',
														['objecttitle'] = '44444',
														['attr'] = { ['imgsrc'] = { ['attrvalue'] = 'testimages/bb.jpg' } }
													},
												[5] =	{
														['id'] = '5',
														['objecttitle'] = '55555',
														['attr'] = { ['imgsrc'] = { ['attrvalue'] = 'testimages/a5.gif' } }
													},
											},
								}
	self.advarea:set_data(data)
	
	
	----------------------------------------------------------------- objectdesc_update

	
	
	local updatectrl = self:get_child("objectdesc_update")
	
	updatectrl:set_use_cache(true)
	
	self.ssfunc = function(a)			
		if a ~= nil then		
			local data = a["data"]
			updatectrl:set_childs_inner_text(data)
			self:updatetick()
		end		
	end
	
	self.ctrls["objectdesc"] = updatectrl
	
	----------------------------
	
	
	self.buydiv = self:get_child("buydiv")
	
	self.btaddlist = self.buydiv:get_child("btaddlist")
	self.btbuy = self.buydiv:get_child("btbuy")
	self.btbuy:set_click(	function()
															local frame = top.hostWindow:get_frame("addServiceFrame")
															--print(frame)															
															frame:set_data(top.data)
															top.hostWindow:addNavFrame("addServiceFrame")	
												end)
	
	self.btfullbuy = self.buydiv:get_child("btfullbuy")
	self.btfullbuy:set_click(	function()
															local frame = top.hostWindow:get_frame("addServiceFrame")							
															frame:set_data(top.data)
															top.hostWindow:addNavFrame("addServiceFrame")	
												end)
	
	----------------------------
	
	self.bar = GmControl.ProcessBarCtrl(self)
end
  

productdetailFrame.set_data = function(self,data)
	self.data = data

	self.bar:set_data(self.data)
	local url = g_serverAddress.."objectdesc/object/withattr/1/withrel/1/id/"..data["id"]
	self:curl(url,self.ssfunc)		
end


productdetailFrame.show = function(self,show,draw,pos)
	GmBase.FrameBase.show(self,show,draw,pos)
	if show then	
		self.advarea:init_pos()
		self:updatetick()
	end
end


