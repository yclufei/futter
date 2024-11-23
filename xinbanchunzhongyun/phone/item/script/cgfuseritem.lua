

-- D:\GOA\reslibrary\templete\res\item\item.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfuseritemItem = inherit(GmCtrl.ControlBase):name("cgfuseritemItem")

cgfuseritemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "cgfuseritemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.id = self:get_child("id")
	
	self.username = self:get_child("username")
	
	self.password = self:get_child("password")
	
	self.create_time = self:get_child("create_time")
	
	self.login_time = self:get_child("login_time")
	
	self.role = self:get_child("role")
	
	self.user_type = self:get_child("user_type")
	
	self.last_active = self:get_child("last_active")
	
	self.master = self:get_child("master")
	
	self.expire = self:get_child("expire")
	
	self.andriod_password = self:get_child("andriod_password")
	
	self.visit = self:get_child("visit")
	
	self.sex = self:get_child("sex")
	
	self.photo = self:get_child("photo")
	
	
	
end


cgfuseritemItem.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	