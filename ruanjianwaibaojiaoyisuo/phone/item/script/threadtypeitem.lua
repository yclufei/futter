

-- D:\GOA\reslibrary\templete\res\item\item.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

threadtypeitemItem = inherit(GmCtrl.ControlBase):name("threadtypeitemItem")

threadtypeitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "threadtypeitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.typeid = self:get_child("typeid")
	
	self.fid = self:get_child("fid")
	
	self.icon = self:get_child("icon")
	
	self.description = self:get_child("description")
	
	self.name = self:get_child("name")
	
	
	
end


threadtypeitemItem.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	