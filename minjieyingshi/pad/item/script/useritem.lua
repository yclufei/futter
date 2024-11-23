

-- D:\GOA\reslibrary\templete\res\item\item.pad.lua.xsl
gr_module("gm_minjieyingshi")

useritemItem = inherit(GmCtrl.ControlBase):name("useritemItem")

useritemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "useritemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.avatar = self:get_child("avatar")
	
	self.member_uid = self:get_child("member_uid")
	
	self.username = self:get_child("username")
	
	
	
end


useritemItem.set_data = function(self,data)
	self.data = data
	
		if data['avatar'] and self.avatar and self.avatar:is_init() then
			self.avatar:set_inner_text(tostring(data['avatar']))
		end
	
		if data['member_uid'] and self.member_uid and self.member_uid:is_init() then
			self.member_uid:set_inner_text(tostring(data['member_uid']))
		end
	
		if data['username'] and self.username and self.username:is_init() then
			self.username:set_inner_text(tostring(data['username']))
		end
	
end


	