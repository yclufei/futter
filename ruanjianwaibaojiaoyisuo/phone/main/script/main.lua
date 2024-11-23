
		


gr_module("gm_ruanjianwaibaojiaoyisuo")

ClientWindow = inherit(GmBase.SmallWindow):name("ClientWindow")


ClientWindow.init = function (self,w,h)

	local top = self
	local win = self
	
	GmBase.SmallWindow.init(self,"ruanjianwaibaojiaoyisuo/phone/main/html/main."..gInfo['retinaX']..".html")



	newthread(function()
		local self = top
	
		self.actionmask:set_visible(false)
		
		self.msgbox = gm_ruanjianwaibaojiaoyisuo.MessageBox(self)

		self:createFrameTemplate('privacy','privacyFrame')
		
		self:createFrameTemplate('login','loginFrame')
		
		self:createFrameTemplate('serviceinfo','serviceinfoFrame')
		
		self:createFrameTemplate('ranklistinfo','ranklistinfoFrame')
		
		self:createFrameTemplate('follower','followerFrame')
		
		self:createFrameTemplate('following','followingFrame')
		
		self:createFrameTemplate('favorite','favoriteFrame')
		
		self:createFrameTemplate('rewardreplyadd','rewardreplyaddFrame')
		
		
		self:createFrameTemplate('serviceadd','serviceaddFrame')
		
		
		self:createFrameTemplate('forumcommentadd','forumcommentaddFrame')
		
		
		self:createFrameTemplate('forumcommentmodify','forumcommentmodifyFrame')
		
		
		self:createFrameTemplate('forumcommentinfo','forumcommentinfoFrame')
		
		self:createFrameTemplate('register','registerFrame')
		
		
		self:createFrameTemplate('userinfo','userinfoFrame')
		
		self:createFrameTemplate('foruminfo','foruminfoFrame')
		
		
		
		
		self:createFrameTemplate('forgetform','forgetformFrame')
		
		
		self:createFrameTemplate('postrewardreply','postrewardreplyFrame')
		
		
		self:createFrameTemplate('productinfo','productinfoFrame')
		
		
		self:createFrameTemplate('rewardinfo','rewardinfoFrame')
		
		
		
			
		
		self:createFrameTemplate('rewardreplyinfo','rewardreplyinfoFrame')
		
		self:createFrameTemplate('setting','settingFrame')
		
		self:createFrameTemplate('ranklistadd','ranklistaddFrame')
		
		self:createFrameTemplate('forumadd','forumaddFrame')
		
		
		
		self:createFrameTemplate('rewardadd','rewardaddFrame')
		
		
		self:createFrameTemplate('useradd','useraddFrame')
		
		
		self:createFrameTemplate('usermodify','usermodifyFrame')
		
		
		self:createFrameTemplate('forummodify','forummodifyFrame')
		
		self:createFrameTemplate('productadd','productaddFrame')
		
		
		self:createFrameTemplate('productmodify','productmodifyFrame')
		
		
		self:createFrameTemplate('rewardmodify','rewardmodifyFrame')
		
		
		self:createFrameTemplate('ranklistmodify','ranklistmodifyFrame')
		
		
		self:createFrameTemplate('rewardreplymodify','rewardreplymodifyFrame')
		
		self:createFrameTemplate('posts','postsFrame')
		
		
		self:createFrameTemplate('usercontactmodify','usercontactmodifyFrame')
		
		self:createFrameTemplate('mythread','mythreadFrame')
		
		
		self:createFrameTemplate('myreply','myreplyFrame')
		
		
		self:createFrameTemplate('forgetsms','forgetsmsFrame')
		
		self:createFrameTemplate('useridnmodify','useridnmodifyFrame')
		
		
		self:createFrameTemplate('useredumodify','useredumodifyFrame')
		
			
		self:createFrameTemplate('userworkmodify','userworkmodifyFrame')
		
		
		self:createFrameTemplate('userlist','userlistFrame')
		
		self:createFrameTemplate('forumlist','forumlistFrame')
		
		self:createFrameTemplate('forumforumlist','forumforumlistFrame')
		
		
		self:createFrameTemplate('threadtypelist','threadtypelistFrame')
		
		self:createFrameTemplate('rewardreplylist','rewardreplylistFrame')
		
		self:createFrameTemplate('servicelist','servicelistFrame')
		
		
		self:createFrameTemplate('servicemodify','servicemodifyFrame')
		
		
		self:createFrameTemplate('ranklistlist','ranklistlistFrame')
		
		self:createFrameTemplate('forumcommentlist','forumcommentlistFrame')
		
		self:createFrameTemplate('msgcenter','msgcenterFrame')
		
		self:createFrameTemplate('productlist','productlistFrame')
		
		self:createFrameTemplate('pwdmodify','pwdmodifyFrame')
				
		self:createFrameTemplate('rewardlist','rewardlistFrame')
	
		self:createFrameTemplate('urscenter','urscenterFrame')
		
		self:createFrameTemplate('project','projectFrame')
		
		self:createFrameTemplate('circle','circleFrame')
		
		self:createFrameTemplate('discover','discoverFrame')
		
	end)
	
	
	self:createFrame('first','firstFrame')
	
	self:set_size(w,h)
	
	self:updatetick(true)

	self:set_visible(true)
	
	self:showFrame('first')
	
		
end   


ClientWindow.createFrame = function(self,key,cls)
	local top = self
	local status, msg = xpcall(function ()
	        --print('#########################',top.topMainScroll,key,gm_ruanjianwaibaojiaoyisuo[cls])
	        top.frame[key] = gm_ruanjianwaibaojiaoyisuo[cls](top.topMainScroll)
	    end, __G__TRACKBACK__)
end


ClientWindow.createFrameTemplate = function(self,key,cls)
	local top = self
	local status, msg = xpcall(function ()
	        top:addFrameTemplete(key,gm_ruanjianwaibaojiaoyisuo[cls])
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


ClientWindow.exec_action = function(self,ctrl,target,attr,needlogin)
	print('ClientWindow.exec_action', ctrl,target,attr,needlogin )
	if needlogin then
		local modal = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
		if modal:has_session() then
			local frame = self:addNavFrame(target,nil,function(ctrl) 
				if ctrl.set_data then
					ctrl:set_data(attr)
				end
			end)
		else
			self:addNavFrame('login')
		end
	else
		local frame = self:addNavFrame(target,nil,function(ctrl) 
			if ctrl.set_data then
				ctrl:set_data(attr)
			end
		end)
	end
end




ClientWindow.on_location = function(self,x,y)
	
	local top = self
	
	self.location = {}
	self.location['x'] = x
	self.location['y'] = y
		
end


	