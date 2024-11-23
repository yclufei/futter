

-- D:\GOA\reslibrary\templete\res\item\item.pad.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

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
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	