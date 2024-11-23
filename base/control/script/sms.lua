
gr_module("GmCtrl")

SmsCtrl = inherit(GmCtrl.ControlBase):name("SmsCtrl")

SmsCtrl.init = function (self,parent,elename)

	local top = self	
	
	GmCtrl.ControlBase.init(self,parent,elename or "smsctrl")

	self.count = 0
	
end


SmsCtrl.on_timeout = function(self)
	print("SmsCtrl.on_timeout")
	self.count = self.count - 1
	if self.count == 0 then
		self:set_inner_text("重新获取验证码")
		self:set_class("font26 color6 box100p")
		self:updatetick()
	else
		self:set_timeout(1000)
		local str = "还剩"..tostring(self.count).."秒"
		self:set_inner_text(str)
		self:set_class("font26 colorAF box100p")
		self:updatetick()
	end
end


SmsCtrl.send = function(self,nickname)
	if self.count ~= 0 then
		return 0,"请稍候,系统正在发送验证码!"
	end
	if string.len(nickname) == 11 and self.count == 0 then
		local top = self
		top.count = 60
		math.randomseed(tostring(os.time()):reverse():sub(1, 6))  
		local num  = tostring( math.random(100000,999999) )
		local tb = {}	
		gf_make_param_by_value_no_esc(tb,'phone',nickname)
		gf_make_param_by_value_no_esc(tb,'num',num)
		local url = gf_make_url_param("Index/sms",tb)
		self:curl(url,function(a) 
										if a["success"] then
											print("SmsCtrl.send")
											top:set_timeout(1000)											
										end
									end)
			tb = nil
			url = nil
		return num,""
	end
	return 0,"请输入正确的手机号码!"
end


