
		


gr_module("gm_ruanjianwaibaojiaoyisuo")

ClientWindow = inherit(GmBase.SmallWindow):name("ClientWindow")


ClientWindow.init = function (self,w,h)

	local top = self
	local win = self
	
	GmBase.MiddleWindow.init(self,"ruanjianwaibaojiaoyisuo/pad/main/html/main.html")
	

	
	self.mainmenu = gm_ruanjianwaibaojiaoyisuo.mainmenuArea(self.body)
	
	self.actionmask:set_visible(false)

	self.msgbox = gm_ruanjianwaibaojiaoyisuo.MessageBox(self)
	
	
			
	self:createFrame('userlist','userlistFrame')
				
	
			
	self:createFrame('useradd','useraddFrame')
				
	
			
	self:createFrame('usermodify','usermodifyFrame')
				
	
			
	self:createFrame('userinfo','userinfoFrame')
				
	
			
	self:createFrame('forumlist','forumlistFrame')
				
	
			
	self:createFrame('forumadd','forumaddFrame')
				
	
			
	self:createFrame('forummodify','forummodifyFrame')
				
	
			
	self:createFrame('forumforumlist','forumforumlistFrame')
				
	
			
	self:createFrame('threadtypelist','threadtypelistFrame')
				
	
			
	self:createFrame('rewardadd','rewardaddFrame')
				
	
			
	self:createFrame('rewardmodify','rewardmodifyFrame')
				
	
			
	self:createFrame('productadd','productaddFrame')
				
	
			
	self:createFrame('productmodify','productmodifyFrame')
				
	
			
	self:createFrame('rewardreplylist','rewardreplylistFrame')
				
	
			
	self:createFrame('rewardreplymodify','rewardreplymodifyFrame')
				
	
			
	self:createFrame('servicelist','servicelistFrame')
				
	
			
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
				
	
			
	self:createFrame('first','firstFrame')
				
	
			
	self:createFrame('project','projectFrame')
				
	
			
	self:createFrame('circle','circleFrame')
				
	
			
	self:createFrame('discover','discoverFrame')
				
	
			
	self:createFrame('urscenter','urscenterFrame')
				
	
			
	self:createFrame('posts','postsFrame')
				
	
			
	self:createFrame('privacy','privacyFrame')
				
	
			
	self:createFrame('login','loginFrame')
				
	
			
	self:createFrame('register','registerFrame')
				
	
			
	self:createFrame('forgetform','forgetformFrame')
				
	
			
	self:createFrame('postrewardreply','postrewardreplyFrame')
				
	
			
	self:createFrame('setting','settingFrame')
				
	
			
	self:createFrame('msgcenter','msgcenterFrame')
				
	
			
	self:createFrame('productinfo','productinfoFrame')
				
	
			
	self:createFrame('rewardinfo','rewardinfoFrame')
				
	
			
	self:createFrame('rewardreplyinfo','rewardreplyinfoFrame')
				
	
			
	self:createFrame('foruminfo','foruminfoFrame')
				
	
			
	self:createFrame('rewardlist','rewardlistFrame')
				
	
			
	self:createFrame('productlist','productlistFrame')
				
	
			
	self:createFrame('follower','followerFrame')
				
	
			
	self:createFrame('following','followingFrame')
				
	
			
	self:createFrame('mythread','mythreadFrame')
				
	
			
	self:createFrame('myreply','myreplyFrame')
				
	
			
	self:createFrame('favorite','favoriteFrame')
				
	
			
	self:createFrame('rewardreplyadd','rewardreplyaddFrame')
				
	
			
	self:createFrame('serviceadd','serviceaddFrame')
				
	
			
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
	        top.frame[key] = gm_ruanjianwaibaojiaoyisuo[cls](top.mScrollViewParent)
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


	