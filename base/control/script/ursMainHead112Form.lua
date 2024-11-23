
gr_module("GmCtrl")

ursMainHead112FormArea = inherit(GmCtrl.ControlBase):name("ursMainHead112FormArea")

ursMainHead112FormArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "ursMainHead112FormArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self.avatar = self:get_child("avatar")
	self.userid = self:get_child("userid")
	self.username = self:get_child("username")
	self.sex = self:get_child("sex")
	self.affectivestatus = self:get_child("affectivestatus")

	GmBase.discuznet.get_instance():add_callback('discuznet.space_profile',self)	
	
end
	

ursMainHead112FormArea.callback = function(self,callbackey,tbname,postparam,data,sortkey,ids)
	if 'discuznet.space_profile' == callbackey then		
		local sdata = data['data']
		self:set_data(sdata)		
		return true
	end
	return false	
end


ursMainHead112FormArea.clear = function(self)
	self.avatar:set_style('background-image:url(/images/delete_8x8_4.png)',true)
	self.affectivestatus:set_inner_text('-')
	self.username:set_inner_text('-')
	self:layout()
end


ursMainHead112FormArea.set_data = function(self,data)

	if data.avatar and type(data.avatar) == 'string' then
		self.avatar:set_style('background-image:url('..data.avatar..')',true)
	end
	
	
	if data.affectivestatus then
		self.affectivestatus:set_inner_text(data.affectivestatus)
	end
	
	if data.username and type(data.username) == 'string' then
		self.username:set_inner_text(data.username)
	end
	
	if data.gender then
		if data.gender == '1' then
			self.sex:set_class('BgSexMan centerbg inblock font34 height45 width38')
		elseif data.gender == '2' then
			self.sex:set_class('BgSexWoman centerbg inblock font34 height45 width38')
		end
	end	
	
	self:layout()
	
end

	