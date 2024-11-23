
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

urscenterFrame = inherit(GmBase.FrameBase):name("urscenterFrame")

urscenterFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_urscenter"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- mainarea
	self.mainarea = gm_ruanjianwaibaojiaoyisuo.urscenterareaArea(self)
	
	-- areamainmenu
	self.areamainmenu = gm_ruanjianwaibaojiaoyisuo.mainmenuArea(self)

	self.areamainmenu:set_index(5)
	
	
	self:set_style('display:none')

	
end


urscenterFrame.set_data_id = function(self,data)
	
	if self.mainarea.set_data_id then
		self.mainarea:set_data_id(data)
	end
				
end


urscenterFrame.set_data = function(self,data)

	if self.mainarea.set_data then
		self.mainarea:set_data(data)
	end
			
end




urscenterFrame.on_show = function(self)
			
	if self.mainarea.on_show then
		self.mainarea:on_show()
	end
			
end


urscenterFrame.on_hide = function(self)
			
	if self.mainarea.on_hide then
		self.mainarea:on_hide()
	end		
			
end

	


	