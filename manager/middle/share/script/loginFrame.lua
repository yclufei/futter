
gr_module("GmManager")

loginFrame = inherit(GmBase.FrameBase):name("loginFrame")

loginFrame.init = function (self,hostWindow,frameid)

	local top = self
	local win = hostWindow
	
	local fid = frameid or "loginFrame"
	GmBase.FrameBase.init(self,hostWindow,fid)

	self:addJumpLink("registerFrame")
	self:addJumpLink("forgetPwdFrame")
			
	gXmpp.on_connected = function(self,bl)
		if not bl then
			print("gXmpp.on_connected ",bl)
			hostWindow:showFrame("loginFrame")
		end
		self.connected = bl
	end
	
	
	gXmpp:add_handler("_xmpp_session1",function()	
															-- 考虑到会直接登录而不通过 loginFrame 登录
															gXmpp:online_state("Available")
															
															hostWindow:InitUI()
															top:set_visible(false)
	
															
															local u = top.username:get_text()
															local p = top.password:get_text()
															top.sql = GmBase.Sqlite()
															top.sql:open(gInfo["path"].."/data")
															local sql = string.format("select count(username) from user where username='%s'",u)			
															local s , res = top.sql:get_count(sql)
															top.sql:exec_insert("update user set last=0;")--先设置所有最后登录标记为 0
															if s then
																if res == 0 then -- 如果数据表还没有则插入用户名和密码
																	sql = string.format("insert or replace into user(username,password,last) values('%s','%s',1);",u,p)
																	top.sql:exec_insert(sql)				
																end
															end	
															sql = string.format("update user set last=1 where username='%s'",u) -- 设置当前登录用户为最后登录用户
															top.sql:exec_insert(sql)
															top.sql:close()	
																											
														end)
	
	
	self.username = self:get_child("username")
	self.password = self:get_child("password")
	self.btlogin = self:get_child("btlogin")
	self.btlogin:set_click( function(self)
	
															top:set_visible(false)
															hostWindow:InitUI()
														--[[
														local y = top.yzm:get_text()
														if string.upper(y) == string.upper(top.code) or string.upper(y) == "1111" then
															local u = top.username:get_text()
															local p = top.password:get_text()
--															print(u,p)
															gXmpp:login("login",u,p)									
														else
--															print("yzm error")
														end
														]]
													end )

	
	self.yzm = self:get_child("yzm")
	self.yzmimg = self:get_child("yzmimg")
	self.code = null	

	self.getYzmImage = function()
		self:curl(g_serverRoot.."yzm/image.php",function(curldata)
				top.code = curldata.path
				local baseurl = g_serverRoot.."yzm/images/%s.png"
				local imgsrc = string.format(baseurl,top.code)
				top.yzmimg:set_attr("src",imgsrc)
				top:updatetick()
			end)
	end
	

	self.yzmimg:set_click(self.getYzmImage)
	
	

	
end


loginFrame.show = function(self,a,b,c,d)
	GmBase.FrameBase.show(self,a,b,c,d)
	if a then
		self.getYzmImage()
	end
end