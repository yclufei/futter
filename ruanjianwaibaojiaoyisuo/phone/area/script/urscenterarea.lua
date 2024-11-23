	
-- area.phone.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

urscenterareaArea = inherit(GmCtrl.ControlBase):name("urscenterareaArea")

urscenterareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "urscenterareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.ursMainHead112Form = GmCtrl.ursMainHead112FormArea(self)
	
		
	self.ursCount = GmCtrl.ursCountCtrl(self)
	
	self.usermodify = self:get_child("usermodify")
	self.usermodify:set_click(function(link)			
		local modal = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
		if modal:has_session() then
			top.hostWindow:addNavFrame('usermodify',nil,function(frame)
			end)
		else
			top.hostWindow:addNavFrame('login')
		end
	end)
	
	
	self.myreward = self:get_child("myreward")
	self.myreward:set_click(function(link)			
		local modal = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
		if modal:has_session() then
			top.hostWindow:addNavFrame('mythread',nil,function(frame)
		end)
		else
			top.hostWindow:addNavFrame('login')
		end
	end)
	
	self.myreply = self:get_child("myreply")
	self.myreply:set_click(function(link)			
		local modal = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
		if modal:has_session() then
			top.hostWindow:addNavFrame('myreply',nil,function(frame)
				
		end)
		else
			top.hostWindow:addNavFrame('login')
		end
	end)
	
	self.favorite = self:get_child("favorite")
	self.favorite:set_click(function(link)			
		local modal = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
		if modal:has_session() then
			top.hostWindow:addNavFrame('favorite',nil,function(frame) end)
		else
			top.hostWindow:addNavFrame('login')
		end
	end)
	
	self.privacy = self:get_child("privacy")
	self.privacy:set_click(function(link)			
			
		top.hostWindow:addNavFrame('privacy',nil,function(frame) end)
					  			
	end)
	
	self.setting = self:get_child("setting")
	self.setting:set_click(function(link)			
		local modal = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
		if modal:has_session() then
			top.hostWindow:addNavFrame('setting',nil,function(frame)
				
		end)
		else
			top.hostWindow:addNavFrame('login')
		end
	end)
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
	self.mgr:add_callback('system.quit',self)

end



urscenterareaArea.on_show = function(self,key)
	
	print('urscenterareaArea.on_show',key)
	
	local usr = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance():get_session('default')
	if usr then
		local a,b,c = usr:GetSingleRecord()
		self:set_data(c)
	end
	
end



urscenterareaArea.callback = function(self,key)
	
	if key == 'system.quit' then
		self.ursMainHead112Form:clear()
	end
	
end




urscenterareaArea.set_data = function(self,data)
	
	
	local uid = data['member_uid']
	
	local mgr = gm_ruanjianwaibaojiaoyisuo.clsprofilemgr.get_instance()
	mgr:SetDirty()
	mgr:SetAttr('uid',uid)
	local a,b,c = mgr:GetSingleRecord()
	if a and b == 1 then
		table.merge(data,c)
	end
			
	self.ursMainHead112Form:set_data(data)
	self.ursCount:set_data(data)
	self:layout()
	self.hostWindow:layout()
	self.hostWindow:updatetickMsg()
	
end

