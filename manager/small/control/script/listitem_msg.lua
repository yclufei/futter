
-- Ìû×ÓÁÐ±í
gr_module("GmControl")

MsgItem = inherit(GmCtrl.ControlBase):name("MsgItem")

MsgItem.init = function (self,parent,itemid)
	local top = self
	local fid = itemid or "listitem_msg"
	GmCtrl.ControlBase.init(self,parent,fid)
	if not itemid then
		self:set_visible(false)
	end
	
	
end


MsgItem.set_data = function(self,data)

	self:set_childs_inner_text(data)

end
