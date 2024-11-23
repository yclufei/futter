	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

settingareaArea = inherit(GmCtrl.ControlBase):name("settingareaArea")

settingareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "settingareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
	
	self:show_scroll_bar(true)

	self.btquit = self:get_child("btquit")
	self.btquit:set_click(function(link)			
		print('btquit')
		gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance():add_session('default',nil)
		top.hostWindow:delTopNavFrame(nil,nil,function() 
					-- todo 退出處理
					local mgr = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
					mgr:handle_callback('system.quit')
				end)
	end)
	
end


settingareaArea.set_ref_data = function(self,data)

end


settingareaArea.set_data = function(self,data)

end


