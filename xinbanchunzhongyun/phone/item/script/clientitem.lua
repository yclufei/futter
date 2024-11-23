

-- D:\GOA\reslibrary\templete\res\item\item.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

clientitemItem = inherit(GmCtrl.ControlBase):name("clientitemItem")

clientitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "clientitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.avatar = self:get_child("avatar")
	
	self.member_uid = self:get_child("member_uid")
	
	self.clientname = self:get_child("clientname")
	
	
	
end


clientitemItem.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	