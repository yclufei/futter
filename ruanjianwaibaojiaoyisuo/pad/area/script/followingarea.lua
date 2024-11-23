	
-- area.pad.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

followingareaArea = inherit(GmCtrl.ControlBase):name("followingareaArea")

followingareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "followingareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)

	
	
	
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.ursMainHead112Form = gm_ruanjianwaibaojiaoyisuo.ursMainHead112FormArea(self)
	
	
	
	--0
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.ursInfoCountForm = gm_ruanjianwaibaojiaoyisuo.ursInfoCountFormArea(self)
	
	
	
	--0
	self.talk = self:get_child("talk")
	self.talk:set_click(function(link)			
		local modal = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
		if modal:has_session() then
			top.hostWindow:addNavFrame('talk',nil,function(frame)
				
		end)
		else
			top.hostWindow:addNavFrame('login')
		end
	end)
		
		
	

end

