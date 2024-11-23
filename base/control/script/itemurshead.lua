
gr_module("GmCtrl")

itemUrsHeadArea = inherit(GmCtrl.ControlBase):name("itemUrsHeadArea")

itemUrsHeadArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "itemUrsHeadArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	self.userid = self:get_child("userid")
	self.username = self:get_child("username")
	self.sex = self:get_child("sex")
	self.affectivestatus = self:get_child("affectivestatus")
	
	self.dataline = self:get_child("subtitle")
	

	self.avatar = self:get_child("avatar")	
	self.avatar.set_inner_text = function(ctrl,src)
			ctrl:set_style("background-image:url('"..src.."')")
	end
	self.avatarclick = self:get_child("avatarclick")
	self.avatarclick:set_click(function(ctrl)
		self.hostWindow:exec_action(ctrl ,'ursdetail', top.data)
	end)
	
	
end
	

itemUrsHeadArea.set_data = function(self,data)

	--print('------------- itemUrsHeadArea.set_data',data)
	--table.print(data)
	
	
	self.data = data
	
	for a,b in pairs(self.data) do
		if self.data[a] and self[a] and type(self[a]) == 'table' and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(self.data[a]))
		end
	end
	
	if data[ "author" ] then
		self.username:set_inner_text(data[ "author" ])
	elseif data[ "username" ] then
		self.username:set_inner_text(datadata[ "username" ])
	end	
	
	if data.authorid then
		self.avatar:set_style("background-image:url('"..g_serverRoot.."uc_server/avatar.php?uid="..tostring(data.authorid).."&size=middle')")
	end	
	
	if data.gender then
		if data.gender == '1' then
			self.sex:set_class('BgSexMan centerbg inblock font34 height45 width38')
		elseif data.gender == '2' then
			self.sex:set_class('BgSexWoman centerbg inblock font34 height45 width38')
		end
	end	
	
end

	