
		


gr_module("gm_xinbanchunzhongyun")

ClientWindow = inherit(GmBase.BigWindow):name("ClientWindow")


ClientWindow.init = function (self,w,h)

	local top = self
	local win = self
	
	GmBase.BigWindow.init(self,"xinbanchunzhongyun/pc/main/html/main.html")
	
	self.sb = self.body:get_child('sysbutton')
	self.sb:set_drag_window(true)
	self.sb:set_dblclick(function(ctrl)
		top.hostWindow:maxbox()
	end)
	
	self.mainmenu = gm_xinbanchunzhongyun.mainmenuArea(self.body)
	self.mainmenu:set_drag_window(true)
	self.mainmenu:set_dblclick(function(ctrl)
		top.hostWindow:maxbox()
	end)

	self.sysbutton  = GmBase.SysButton(self.hostWindow,true,true,true)
	
	self.actionmask:set_visible(false)

	self.msgbox = gm_xinbanchunzhongyun.MessageBox(self)
	
	
	
	
			
	self:createFrame('cgfcustomerlist','cgfcustomerlistFrame')
				
	
			
	self:createFrame('cgfcustomeradd','cgfcustomeraddFrame')
				
	
			
	self:createFrame('cgfcustomermodify','cgfcustomermodifyFrame')
				
	
			
	self:createFrame('cgfcustomerinfo','cgfcustomerinfoFrame')
				
	
			
	self:createFrame('cgforderlist','cgforderlistFrame')
				
	
			
	self:createFrame('cgforderadd','cgforderaddFrame')
				
	
			
	self:createFrame('cgfordermodify','cgfordermodifyFrame')
				
	
			
	self:createFrame('cgforderinfo','cgforderinfoFrame')
				
	
			
	self:createFrame('cgfscriptlist','cgfscriptlistFrame')
				
	
			
	self:createFrame('cgfscriptadd','cgfscriptaddFrame')
				
	
			
	self:createFrame('cgfscriptmodify','cgfscriptmodifyFrame')
				
	
			
	self:createFrame('cgfscriptinfo','cgfscriptinfoFrame')
				
	
			
	self:createFrame('cgfuserlist','cgfuserlistFrame')
				
	
			
	self:createFrame('cgfuseradd','cgfuseraddFrame')
				
	
			
	self:createFrame('cgfusermodify','cgfusermodifyFrame')
				
	
			
	self:createFrame('cgfuserinfo','cgfuserinfoFrame')
				
	
			
	self:createFrame('login','loginFrame')
				
	
			
	self:createFrame('producttypemgr','producttypemgrFrame')
				
	
			
	self:createFrame('producttypemodify','producttypemodifyFrame')
				
	
			
	self:createFrame('producttypeadd','producttypeaddFrame')
				
	
			
	self:createFrame('productadd','productaddFrame')
				
	
			
	self:createFrame('productmodify','productmodifyFrame')
				
	
			
	self:createFrame('clientypemgr','clientypemgrFrame')
				
	
			
	self:createFrame('clientypemodify','clientypemodifyFrame')
				
	
			
	self:createFrame('clientypeadd','clientypeaddFrame')
				
	
			
	self:createFrame('clientadd','clientaddFrame')
				
	
			
	self:createFrame('clientmodify','clientmodifyFrame')
				
	
			
	self:createFrame('ordertypemgr','ordertypemgrFrame')
				
	
			
	self:createFrame('ordertypemodify','ordertypemodifyFrame')
				
	
			
	self:createFrame('ordertypeadd','ordertypeaddFrame')
				
	
			
	self:createFrame('orderadd','orderaddFrame')
				
	
			
	self:createFrame('ordermodify','ordermodifyFrame')
				
	
			
	self:createFrame('orderrecycle','orderrecycleFrame')
				
	
			
	self:createFrame('invoiceadd','invoiceaddFrame')
				
	
			
	self:createFrame('invoicemodify','invoicemodifyFrame')
				
	
			
	self:createFrame('formulatypemgr','formulatypemgrFrame')
				
	
			
	self:createFrame('formulatypemodify','formulatypemodifyFrame')
				
	
			
	self:createFrame('formulatypeadd','formulatypeaddFrame')
				
	
			
	self:createFrame('formulaadd','formulaaddFrame')
				
	
			
	self:createFrame('formulamodify','formulamodifyFrame')
				
	
			
	self:createFrame('gallerytypemgr','gallerytypemgrFrame')
				
	
			
	self:createFrame('gallerytypemodify','gallerytypemodifyFrame')
				
	
			
	self:createFrame('gallerytypeadd','gallerytypeaddFrame')
				
	
			
	self:createFrame('galleryadd','galleryaddFrame')
				
	
			
	self:createFrame('gallerymodify','gallerymodifyFrame')
				
	
			
	self:createFrame('note','noteFrame')
				
	
			
	self:createFrame('dealercheckorder','dealercheckorderFrame')
				
	
			
	self:createFrame('warning','warningFrame')
				
	
			
	self:createFrame('logistics','logisticsFrame')
				
	
			
	self:createFrame('aftersales','aftersalesFrame')
				
	
			
	self:createFrame('scanprint','scanprintFrame')
				
	
			
	self:createFrame('sysinit','sysinitFrame')
				
	
			
	self:createFrame('permission','permissionFrame')
				
	
			
	self:createFrame('pwdmodify','pwdmodifyFrame')
				
	
			
	self:createFrame('dataclear','dataclearFrame')
				
	
			
	self:createFrame('softmaintenance','softmaintenanceFrame')
				
	
			
	self:createFrame('quickform','quickformFrame')
				
	
			
	self:createFrame('paramsetting','paramsettingFrame')
				
	
			
	self:createFrame('intro','introFrame')
				
	
			
	self:createFrame('printsetting','printsettingFrame')
				
	
			
	self:createFrame('smsetting','smsettingFrame')
				
	
			
	self:createFrame('tagsetting','tagsettingFrame')
				
	
			
	self:createFrame('qrsearchsetting','qrsearchsettingFrame')
				
	
			
	self:createFrame('mobile','mobileFrame')
				
	
			
	self:createFrame('remotesetting','remotesettingFrame')
				
	
			
	self:createFrame('ipmonitor','ipmonitorFrame')
				
	
			
	self:createFrame('oplog','oplogFrame')
				
	
			
	self:createFrame('mainfirst','mainfirstFrame')
				
	
			
	self:createFrame('mainproduct','mainproductFrame')
				
	
			
	self:createFrame('mainclient','mainclientFrame')
				
	
			
	self:createFrame('mainorder','mainorderFrame')
				
	
			
	self:createFrame('mainformula','mainformulaFrame')
				
	
			
	self:createFrame('maingallery','maingalleryFrame')
				
	
			
	self:createFrame('systemsetting','systemsettingFrame')
				
			
	
	
	self:updatetick()
	
	self:set_size(w,h)
	
	self:set_visible(true)
	
	
	
	
			
	self:showFrame('login')
				
		
		
	
	self:layout()
	

	self:updatetick()

end   



ClientWindow.createFrame = function(self,key,cls)
	local top = self
	local status, msg = xpcall(function ()
	        top.frame[key] = gm_xinbanchunzhongyun[cls](top.mScrollViewParent)
	    end, __G__TRACKBACK__)
end



ClientWindow.init_data = function(self)
	local top = self

	if gInfo['location']  and gInfo['location']['x'] > 0 and gInfo['location']['y'] > 0 then
		self:on_location(gInfo['location']['x'] , gInfo['location']['y'])
	else
		self:start_location()	
		self.mScrollViewParent:set_timeout(2)
	end

	self.curframe.advmulBigArea:start()
	
end


ClientWindow.showMsg = function(self,msgtext)
	self.msgbox:set_data(msgtext)
end



ClientWindow.on_command = function(self,data)
	local top = self
	if self:has_frame(data.name) then
		local frame = self:addNavFrame(data.name)
	elseif data.name == 'quit' then
	
	end
end





ClientWindow.on_location = function(self,x,y)
	
	
	local top = self
	
	self.location = {}
	self.location['x'] = x
	self.location['y'] = y
		
		
		self.addrcallback = function(data)
		
			if data["success"] then
				top.location = data['main']
				local frame =	top:get_frame("GOFrame")
				if frame then
					frame:init_list(data['near'])
				else
					print("no goframe")
				end
			end
		end
		
	
end


	