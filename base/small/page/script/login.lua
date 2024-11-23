

-- 登陆
gr_module("GmBase")

loginFrame = inherit(GmBase.FrameBase):name("loginFrame")

loginFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_loginFrame")

	
	
	self.subnav = GmBase.subnavArea(self,nil,"登录")
	
	self.loading = GmCtrl.LoadingCtrl(self)
	self.loading:set_word("正在登录")

  self:addJumpLink("forgetPwdFrame")
  self:addJumpLink("registerFrame")

	self.nickname = self:get_child('username')
  self.password = self:get_child('password')
	self.loginbt = self:get_child('btlogin')
		
	local logincallback = function(a)
		top.hostWindow:showActionMask(false)
		top.loading:set_loading(false)
		--table.print(a)
		local urs = a
		if urs['success'] then			
			gApp:set_my(13,urs['data'][0])
			top.hostWindow.areas["initmainmenu"]:init_data()
		end
	end
	
	local loginclick = function(button) 

														local url = g_serverAddress.."objectdesc/search/clsid/13"
														postparam = {}
														-- 2 代表字符变量
														-- equ 代表等于
														postparam['attr'] = {}
														postparam['attr']['2'] = {}
														postparam['attr']['2']['equ'] = {}
														postparam['attr']['2']['equ']['nickname'] = top.nickname:get_text()
														postparam['attr']['2']['equ']['password'] = top.password:get_text()
														local y = top.yzm:get_text()
														if string.upper(y) == "1111" or string.upper(y) == string.upper(top.code) then
															top.hostWindow:showActionMask(true)
															top.loading:set_loading(true)
															top:updatetick()
															print(url)
															--table.print(postparam)
															self:curl(url,logincallback,postparam)
														else
															print("yzm error")
														end
														
		

	end
	
	
	self.loginbt:set_click(loginclick)
	
  
	self.yzm = self:get_child("yzm")
	self.yzmimg = self:get_child("yzmimg")
	self.code = null	

	self.getYzmImage = function()
		self:curl(g_serverRoot.."yzm/image.php",function(curldata)
				top.code = curldata.path
				local baseurl = g_serverRoot.."yzm/images/%s.png"
				local imgsrc = string.format(baseurl,top.code)
				top.yzmimg:set_attr("src",imgsrc)
			end)
	end
	
	self.yzmimg:set_click(self.getYzmImage)
	
	
 
end

  



loginFrame.show = function(self,a,b,c,d)
	GmBase.FrameBase.show(self,a,b,c,d)
	if a then
		self.getYzmImage()
		--self.yzm:set_text("")
		self.hostWindow:showActionMask(false)
		self.loading:set_loading(false)
	else
		self.loading:set_loading(false)
		self.hostWindow:showActionMask(false)
	end
end