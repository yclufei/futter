	
gr_module("gm_ruanjianwaibaojiaoyisuo")

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
	print('ursMainHead112FormArea.callback',callbackey,tbname,sortkey,ids)
	if 'discuznet.space_profile' == callbackey then		
		local sdata = data['data']
		self:set_data(sdata)		
		return true
	end
	return false	
end

ursMainHead112FormArea.set_data = function(self,data)
	print('ursMainHead112FormArea.set_data',data.affectivestatus)
	if data.affectivestatus then
		self.affectivestatus:set_inner_text(data.affectivestatus)
	end
	if data.username and type(data.username) == 'string' then
		self.username:set_inner_text(data.username)
	end
	if data.avatar and type(data.avatar) == 'string' then
		self.avatar:set_style('background:url('..data.avatar..')')
	end
	if data.gender then
		if data.gender == '1' then
			self.sex:set_class('BgSexMan centerbg inblock font34 height45 width38')
		elseif data.gender == '2' then
			self.sex:set_class('BgSexWoman centerbg inblock font34 height45 width38')
		end
	end	
end



	