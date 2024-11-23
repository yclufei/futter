

-- D:\GOA\reslibrary\templete\res\item\item.phone.lua.xsl
gr_module("gm_minjieyingshi")

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
	
		if data['typeid'] and self.typeid and self.typeid:is_init() then
			self.typeid:set_inner_text(tostring(data['typeid']))
		end
	
		if data['fid'] and self.fid and self.fid:is_init() then
			self.fid:set_inner_text(tostring(data['fid']))
		end
	
		if data['icon'] and self.icon and self.icon:is_init() then
			self.icon:set_inner_text(tostring(data['icon']))
		end
	
		if data['description'] and self.description and self.description:is_init() then
			self.description:set_inner_text(tostring(data['description']))
		end
	
		if data['name'] and self.name and self.name:is_init() then
			self.name:set_inner_text(tostring(data['name']))
		end
	
end


	