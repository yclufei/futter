
-- 注册
gr_module("GmBase")

registerFrame = inherit(GmBase.FrameBase):name("registerFrame")

registerFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_registerFrame")

	self.msg_callback = function(a)
		table.print(a)
	end

	gXmpp:add_handler("register",function()
															hostWindow:showFrame("loginFrame")															
															hostWindow:showActionMask(false)
														end)

	self.yzm = self:get_child("yzm")
	self.nickname = self:get_child("nickname")
	self.password = self:get_child("password")
	self.passwordagain = self:get_child("passwordagain")
	
	self.sendbt = self:get_child("sendbt")
	self.sendbt:set_click( 	function(button) 
															local nickname = top.nickname:get_text()
															if string.len(nickname) == 11 then
																math.randomseed(tostring(os.time()):reverse():sub(1, 6))  
																top.r = tostring( math.random(100000,999999) )
																local baseurl = "http://v.juhe.cn/sms/send?mobile=%s&tpl_id=%d&tpl_value=%s&key=%s"
																local str = "%23app%23%3D%E5%9B%BD%E5%85%B4%E8%BD%AF%E4%BB%B6%E5%B7%A5%E4%BD%9C%E5%AE%A4APP+DEMO%26%23code%23%3D"..top.r
																local url = string.format(baseurl,nickname,3814,str,"9e439b83a3577a83f133577c387d7021")
																top:curl(url,top.msg_callback)
															else
																print("phone number error")	
															end
														end)
														
														
	self.subnav = GmBase.subnavArea(self,nil,"注册")
	self.subnav:set_left("NavTDWidth backNavTD",	function()	
																			top.hostWindow:delTopNavFrame()
																		end)

 
	self.submitbt = self:get_child("submitbt")
	self.submitbt:set_click( 	function(button) 
	
															local yzm = top.yzm:get_text()
															local nickname = top.nickname:get_text()
															local password = top.password:get_text()
															local passwordagain = top.passwordagain:get_text()
															
															print(top.r,yzm,nickname,password,passwordagain)
															
															if string.len(yzm) == 6 and string.len(nickname) == 11 and string.len(password) > 4 and string.len(passwordagain) > 4 then
																if password == passwordagain then
																	if top.r == yzm then	
																		if gXmpp then														
																			gXmpp:register("register",nickname,password,"sfa@sf.com","dlfgli")
																		else
																			print("g_xmpp error")
																		end
																	else
																		print("yzm error")
																	end
																else
																	print("passwordagain error")		
																end	
															else
																print("all not null")	
															end
															
														end)
  
 
end

  
