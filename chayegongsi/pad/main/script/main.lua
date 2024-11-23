
		


gr_module("gm_chayegongsi")

ClientWindow = inherit(GmBase.SmallWindow):name("ClientWindow")


ClientWindow.init = function (self,w,h)

	local top = self
	local win = self
	
	GmBase.MiddleWindow.init(self,"chayegongsi/pad/main/html/main.html")
	

	
	self.mainmenu = gm_chayegongsi.mainmenuArea(self.body)
	
	self.actionmask:set_visible(false)

	self.msgbox = gm_chayegongsi.MessageBox(self)
	
	
			
	self:createFrame('userlist','userlistFrame')
				
	
			
	self:createFrame('useradd','useraddFrame')
				
	
			
	self:createFrame('usermodify','usermodifyFrame')
				
	
			
	self:createFrame('userinfo','userinfoFrame')
				
	
			
	self:createFrame('forummodify','forummodifyFrame')
				
	
			
	self:createFrame('forumforumlist','forumforumlistFrame')
				
	
			
	self:createFrame('threadtypelist','threadtypelistFrame')
				
	
			
	self:createFrame('rewardlist','rewardlistFrame')
				
	
			
	self:createFrame('rewardadd','rewardaddFrame')
				
	
			
	self:createFrame('rewardmodify','rewardmodifyFrame')
				
	
			
	self:createFrame('rewardinfo','rewardinfoFrame')
				
	
			
	self:createFrame('productmodify','productmodifyFrame')
				
	
			
	self:createFrame('productinfo','productinfoFrame')
				
	
			
	self:createFrame('rewardreplylist','rewardreplylistFrame')
				
	
			
	self:createFrame('rewardreplyadd','rewardreplyaddFrame')
				
	
			
	self:createFrame('rewardreplymodify','rewardreplymodifyFrame')
				
	
			
	self:createFrame('rewardreplyinfo','rewardreplyinfoFrame')
				
	
			
	self:createFrame('servicelist','servicelistFrame')
				
	
			
	self:createFrame('serviceadd','serviceaddFrame')
				
	
			
	self:createFrame('servicemodify','servicemodifyFrame')
				
	
			
	self:createFrame('serviceinfo','serviceinfoFrame')
				
	
			
	self:createFrame('ranklistlist','ranklistlistFrame')
				
	
			
	self:createFrame('ranklistadd','ranklistaddFrame')
				
	
			
	self:createFrame('ranklistmodify','ranklistmodifyFrame')
				
	
			
	self:createFrame('ranklistinfo','ranklistinfoFrame')
				
	
			
	self:createFrame('forumcommentlist','forumcommentlistFrame')
				
	
			
	self:createFrame('forumcommentadd','forumcommentaddFrame')
				
	
			
	self:createFrame('forumcommentmodify','forumcommentmodifyFrame')
				
	
			
	self:createFrame('forumcommentinfo','forumcommentinfoFrame')
				
	
			
	self:createFrame('first2','first2Frame')
				
	
			
	self:createFrame('buyfirst','buyfirstFrame')
				
	
			
	self:createFrame('urscenter2','urscenter2Frame')
				
	
			
	self:createFrame('bill','billFrame')
				
	
			
	self:createFrame('forumadd','forumaddFrame')
				
	
			
	self:createFrame('mysalebill','mysalebillFrame')
				
	
			
	self:createFrame('mybuybill','mybuybillFrame')
				
	
			
	self:createFrame('buyed','buyedFrame')
				
	
			
	self:createFrame('canceled','canceledFrame')
				
	
			
	self:createFrame('order','orderFrame')
				
	
			
	self:createFrame('quotations','quotationsFrame')
				
	
			
	self:createFrame('speteadetail','speteadetailFrame')
				
	
			
	self:createFrame('spetealist','spetealistFrame')
				
	
			
	self:createFrame('growers','growersFrame')
				
	
			
	self:createFrame('forumlist','forumlistFrame')
				
	
			
	self:createFrame('foruminfo','foruminfoFrame')
				
	
			
	self:createFrame('trade','tradeFrame')
				
	
			
	self:createFrame('intention','intentionFrame')
				
	
			
	self:createFrame('productadd','productaddFrame')
				
	
			
	self:createFrame('privacy','privacyFrame')
				
	
			
	self:createFrame('login','loginFrame')
				
	
			
	self:createFrame('register','registerFrame')
				
	
			
	self:createFrame('forgetform','forgetformFrame')
				
	
			
	self:createFrame('setting','settingFrame')
				
	
			
	self:createFrame('msgcenter','msgcenterFrame')
				
	
			
	self:createFrame('productlist','productlistFrame')
				
	
			
	self:createFrame('forgetsms','forgetsmsFrame')
				
	
			
	self:createFrame('pwdmodify','pwdmodifyFrame')
				
			
	
	
	self:set_size(w,h)
	
	self:layout()
	
	self:set_visible(true)

	self:updatetick()

end   



ClientWindow.createFrame = function(self,key,cls)
	local top = self
	local status, msg = xpcall(function ()
	        top.frame[key] = gm_chayegongsi[cls](top.mScrollViewParent)
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
		
	
	
end


	