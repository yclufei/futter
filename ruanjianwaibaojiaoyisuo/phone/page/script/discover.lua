
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

discoverFrame = inherit(GmBase.FrameBase):name("discoverFrame")

discoverFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_discover"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- mainarea
	self.mainarea = gm_ruanjianwaibaojiaoyisuo.discoverareaArea(self)
	
	if self.mainarea.set then
		
		self.mainarea:set('fid','91')
		
		self.mainarea:set('closed','0')
				
	end
	
	-- areamainmenu
	self.areamainmenu = gm_ruanjianwaibaojiaoyisuo.mainmenuArea(self)
	

	self.areamainmenu:set_index(4)

	if self.areanav.set_title then
		self.areanav:set_title('发现')
	elseif self.areanav.set then
		self.areanav:set('title','发现')
	end
	
	
	self:set_style('display:none')

	
end


discoverFrame.set_data_id = function(self,data)
	
	if self.mainarea.set_data_id then
		self.mainarea:set_data_id(data)
	end
				
end


discoverFrame.set_data = function(self,data)

	self.data = data
	
	if self.mainarea.set_data then
		self.mainarea:set_data(data)
	end
			
end





discoverFrame.on_show = function(self,key)
	if self.mainarea.on_show then
		self.mainarea:on_show(key)
	end
end


discoverFrame.on_hide = function(self,key)
	if self.mainarea.on_hide then
		self.mainarea:on_hide(key)
	end
end



	