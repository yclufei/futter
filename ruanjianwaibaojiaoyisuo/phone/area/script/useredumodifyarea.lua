	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

useredumodifyareaArea = inherit(GmCtrl.ControlBase):name("useredumodifyareaArea")

useredumodifyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "useredumodifyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	self.educationdata = {}
	
	self.educationdata["博士"] = '博士'
	self.educationdata["硕士"] = '硕士'
	self.educationdata["本科"] = '本科'
	self.educationdata["专科"] = '专科'
	self.educationdata["中学"] = '中学'
	self.educationdata["小学"] = '小学'
	self.educationdata["其它"] = '其它'
	
	self.education = GmCtrl.ItemSelectCtrl(self.scrollcontainer,'education','组织', self.educationdata,	function(k,v) 
																																														top.education:set(k,v) 
																																													end)
																																													
	
	self.graduateschool = GmCtrl.ItemInputCtrl(self.scrollcontainer,'graduateschool','毕业院校', ' ',	function(k,v) top.graduateschool:set(k,v) end)
	
	
	      
	      
	GmBase.discuznet.get_instance():add_callback('discuznet.space_profile',self)	
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsusermgr(self.movecount)
		
	self.net = GmBase.discuznet.get_instance()
	self.netmethon = 'space_profile'	

end



useredumodifyareaArea.save = function(self)
	self.mgr:run('spacecp_profile_edu',self)
end


useredumodifyareaArea.callback = function(self,callbackey,tbname,postparam,data,sortkey,ids)

	print('useredumodifyareaArea.callback',callbackey,tbname,postparam,data,sortkey,ids)
	
	if 'discuznet.space_profile' == callbackey then		

		local sdata = data['data']
		
		for a,b in pairs(sdata) do
			if self[a] and type(self[a]) == 'table' and self[a].set_text then
				print(a,b)
				self[a]:set_text(b)
			end
		end
		
		local education = sdata['education']
		if education then
			for k,v in pairs(self.educationdata) do
				if v == field1 then
					self.education:set(v,v)
				end
			end
		end
		
		return true
	end
	return false
end





useredumodifyareaArea.set_ref_data = function(self,data)
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


useredumodifyareaArea.set_data = function(self,data)
	self.data = data
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
end


