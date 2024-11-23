

-- D:\GOA\reslibrary\templete\res\item\item.pc.lua.xsl
gr_module("gm_xinbanchunzhongyun")

cgfscriptitemItem = inherit(GmCtrl.ControlBase):name("cgfscriptitemItem")

cgfscriptitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "cgfscriptitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.id = self:get_child("id")
	
	self.group_id = self:get_child("group_id")
	
	self.format_id = self:get_child("format_id")
	
	self.separator = self:get_child("separator")
	
	self.separator_list = self:get_child("separator_list")
	
	self.name = self:get_child("name")
	
	self.note = self:get_child("note")
	
	self.thumb_url = self:get_child("thumb_url")
	
	self.photo_url = self:get_child("photo_url")
	
	self.priority = self:get_child("priority")
	
	self.tags = self:get_child("tags")
	
	self.f_id = self:get_child("f_id")
	
	self.is_lock = self:get_child("is_lock")
	
	self.margin = self:get_child("margin")
	
	self.script_type = self:get_child("script_type")
	
	self.global_format = self:get_child("global_format")
	
	
	
end


cgfscriptitemItem.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	