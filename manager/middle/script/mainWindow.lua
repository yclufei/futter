gr_module("GmManager")

MainWindow = inherit(GmBase.MiddleWindow):name("MainWindow")

MainWindow.init = function (self,w,h)

	local top = self
	local win = self
	
	GmBase.MiddleWindow.init(self,"manager/middle/html/main.html")


	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top:delTopNavFrame()
	end)
	

	self.frame["aboutFrame"] = Gmenterprise.aboutFrame(self)
	self.frame["feedbackFrame"] = Gmenterprise.feedbackFrame(self)
	self.frame["otherappFrame"] = Gmenterprise.otherappFrame(self)
	self.frame["registerFrame"] = Gmenterprise.registerFrame(self)
	self.frame["updateFrame"] = Gmenterprise.updateFrame(self)
	self.frame["protocalFrame"] = Gmenterprise.protocalFrame(self)
	self.frame["settingFrame"] = Gmenterprise.settingFrame(self)
	self.frame["ursinfoFrame"] = Gmenterprise.ursinfoFrame(self)
	self.frame["forgetpwdFrame"] = Gmenterprise.forgetpwdFrame(self)
	self.frame["loginFrame"] = Gmenterprise.loginFrame(self)
	self.frame["urscenterFrame"] = Gmenterprise.urscenterFrame(self)
	self.frame["firstFrame"] = Gmenterprise.firstFrame(self)
	self.frame["area_mainmenu"] = Gmenterprise.mainmenuFrame(self)
	
	self:addSubMenuLink("setting")
	self:addSubMenuLink("urscenter")


	if gInfo["os"] == "win" then
		self:set_pos(120,120)
		self:set_size(780,600)
	end
	self:set_visible(true)
			 
	self:showFrame("firstFrame")
	
end