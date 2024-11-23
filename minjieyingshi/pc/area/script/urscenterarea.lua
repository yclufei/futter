	
-- area.pc.lua.xsl
					
gr_module("gm_minjieyingshi")

urscenterareaArea = inherit(GmCtrl.ControlBase):name("urscenterareaArea")

urscenterareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "urscenterareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.ursMainHead112Form = gm_minjieyingshi.ursMainHead112FormArea(self)
	
	
	
	--0
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.ursInfoCountForm = gm_minjieyingshi.ursInfoCountFormArea(self)
	
	
	
	--0
	self.sessioninfo = self:get_child("sessioninfo")
	self.sessioninfo:set_click(function(link)			
		local modal = gm_minjieyingshi.clsusermgr.get_instance()
		if modal:has_session() then
			top.hostWindow:addNavFrame('usermodify',nil,function(frame)
				
		end)
		else
			top.hostWindow:addNavFrame('login')
		end
	end)
	
	self.privacy = self:get_child("privacy")
	self.privacy:set_click(function(link)			
			
		top.hostWindow:addNavFrame('privacy',nil,function(frame)
				
		end)
					  			
	end)
	
	self.setting = self:get_child("setting")
	self.setting:set_click(function(link)			
		local modal = gm_minjieyingshi.clsusermgr.get_instance()
		if modal:has_session() then
			top.hostWindow:addNavFrame('setting',nil,function(frame)
				
		end)
		else
			top.hostWindow:addNavFrame('login')
		end
	end)
		
		
	
	GmBase.usernet.get_instance():add_callback('usernet.loginform',self)	

end



urscenterareaArea.callback = function(self,key,tbname,post,result)
	if key == 'usernet.loginform' and result['success'] then
		local ok,data = g_translate_item(self._ID,tbname,result['data'])
		self:set_data(data)
		return true
	end
end


urscenterareaArea.set_data = function(self,data)
	print('urscenterareaArea.callback',k)
--	table.print(data)
	self.ursMainHead112Form:set_data(data)
	self.ursInfoCountForm:set_data(data)
end

