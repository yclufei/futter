	

-- D:\GOA\reslibrary\templete\res\area\area.phone.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

postrewardreplyareaArea = inherit(GmCtrl.ControlBase):name("postrewardreplyareaArea")

postrewardreplyareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "postrewardreplyareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	
	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)
			
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsrewardreplymgr.get_instance()
	self.mgr:add_ui('postrewardreplyareaArea',self)
	
		
	self.public = self:get_child('public')
	self.public:set_click(function(link)			
		-- todo
		top.mgr:run('rewardreplypost',top)
	end)
		
	self.sorkey = ''
	

	self.page = 0
	
	self:show_scroll_bar(true)

end


	
postrewardreplyareaArea.callback = function(self,key,tb)
	local attrs = self.mgr:GetAttrs()
  if tb.act == 'prev' and table.eq(attrs,tb) then		
		self.mgr:SetPageDirty(true)
		self:clean()
		self:init_item_data()
		self.toploading:set_loading(false)
		self:updatetick(true)
		return true
	else
		print('postrewardreplyareaArea callback error ',key,tb)
	end
end




postrewardreplyareaArea.set_ref_data = function(self,data)
--	table.print(data)
	for a,b in pairs(data) do
		if self[a] then
			self[a]:set_text(b)
		end
	end
end


postrewardreplyareaArea.set_data = function(self,data)
	self.data = data
	
	if self.attr and self.attr.set_data then
		self.attr:set_data(data)
	end
		
	
	for a,b in pairs(data) do
		if self[a] ~= nil and self[a].set_text ~= nil then
			self[a]:set_text(tostring(b))
		end
	end
	
end


