
gr_module("GmCtrl")

UserHead68Ctrl = inherit(GmCtrl.ControlBase):name("UserHead68Ctrl")

UserHead68Ctrl.init = function(self,parent,dontshowusrname)

	local top = self	
	GmCtrl.ControlBase.init(self,parent,elename or "UserHead68Ctrl")
	
	self.avatar_div = self:get_child("avatar_div")
	
	self.headpic = self:get_child("headpic_div")
	self.headpic:set_click(function(ctrl)
		top.hostWindow:exec_action(ctrl ,'userinfo', top.data, true)
	end)
	
	
	self.username = self:get_child('username_div')
	self.username:set_click(function(ctrl)
		top.hostWindow:exec_action(ctrl ,'userinfo', top.data, true)
	end)
	if dontshowusrname then
		self.username:set_style('display:none')
	end
	
end


UserHead68Ctrl.set_data = function(self,data)
	self.data = data
	
	if data.username then
		self.username:set_inner_text(tostring(data['username']))
	elseif data.author then
		self.username:set_inner_text(tostring(data['author']))
	end
	
	if data.avatar and type(data.avatar) == 'string' then
		self.avatar_div:set_style('background-image:url('..data.avatar..')',true)
	elseif data.uid then
		self.avatar_div:set_style("background-image:url('"..g_serverRoot.."uc_server/avatar.php?uid="..tostring(data.uid).."&size=middle')")
	end	
	
	for a,b in pairs(data) do
		if data[a] and self[a] and type(self[a]) == 'table' and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
	
end
