
		


gr_module("gm_minjieyingshi")

ClientWindow = inherit(GmBase.MiddleWindow):name("ClientWindow")


ClientWindow.init = function (self,w,h)

	local top = self
	local win = self
	
	GmBase.MiddleWindow.init(self,"minjieyingshi/pad/main/html/main.html")
	

	
	self.actionmask:set_visible(false)

	self.msgbox = gm_minjieyingshi.MessageBox(self)
	
	
			
	self:createFrame('userlist','userlistFrame')
				
	
			
	self:createFrame('useradd','useraddFrame')
				
	
			
	self:createFrame('usermodify','usermodifyFrame')
				
	
			
	self:createFrame('userinfo','userinfoFrame')
				
	
			
	self:createFrame('videoadd','videoaddFrame')
				
	
			
	self:createFrame('videomodify','videomodifyFrame')
				
	
			
	self:createFrame('threadtypelist','threadtypelistFrame')
				
	
			
	self:createFrame('ranklistlist','ranklistlistFrame')
				
	
			
	self:createFrame('ranklistadd','ranklistaddFrame')
				
	
			
	self:createFrame('ranklistmodify','ranklistmodifyFrame')
				
	
			
	self:createFrame('ranklistinfo','ranklistinfoFrame')
				
	
			
	self:createFrame('forumcommentlist','forumcommentlistFrame')
				
	
			
	self:createFrame('forumcommentadd','forumcommentaddFrame')
				
	
			
	self:createFrame('forumcommentmodify','forumcommentmodifyFrame')
				
	
			
	self:createFrame('forumcommentinfo','forumcommentinfoFrame')
				
	
			
	self:createFrame('first','firstFrame')
				
	
			
	self:createFrame('recommend','recommendFrame')
				
	
			
	self:createFrame('sortlist','sortlistFrame')
				
	
			
	self:createFrame('videolist','videolistFrame')
				
	
			
	self:createFrame('discover','discoverFrame')
				
	
			
	self:createFrame('local','localFrame')
				
	
			
	self:createFrame('like','likeFrame')
				
	
			
	self:createFrame('urscenter','urscenterFrame')
				
	
			
	self:createFrame('history','historyFrame')
				
	
			
	self:createFrame('favorite','favoriteFrame')
				
	
			
	self:createFrame('privacy','privacyFrame')
				
	
			
	self:createFrame('login','loginFrame')
				
	
			
	self:createFrame('register','registerFrame')
				
	
			
	self:createFrame('forgetform','forgetformFrame')
				
	
			
	self:createFrame('setting','settingFrame')
				
	
			
	self:createFrame('videoinfo','videoinfoFrame')
				
	
			
	self:createFrame('player','playerFrame')
				
			
	
	
	self:set_size(w,h)
	
	self:layout()
	
	
	self:set_visible(true)

	print('################################################################################# begin')
	
	print('###################################################### ',self.showFrame)
	
	self:showFrame('login')
	
	print('################################################################################# end')

end   



ClientWindow.createFrame = function(self,key,cls)
	local top = self
	local status, msg = xpcall(function ()
	        top.frame[key] = gm_minjieyingshi[cls](top.mScrollViewParent)
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


	