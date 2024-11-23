
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

forgetformFrame = inherit(GmBase.FrameBase):name("forgetformFrame")

forgetformFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forgetform"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areaforgetformarea
	self.areaforgetformarea = gm_ruanjianwaibaojiaoyisuo.forgetformareaArea(self)
	
		if self.areanav.set_left then
			self.areanav:set_left('back')
		elseif self.areanav.set then
			self.areanav:set('left','back')
		end
					
		if self.areanav.set_title then
			self.areanav:set_title('找回密码')
		elseif self.areanav.set then
			self.areanav:set('title','找回密码')
		end
					
	
	self.mainarea = self.areaforgetformarea
	
	self:set_style('display:none')

	
end


forgetformFrame.set_data_id = function(self,data)
	
	if self.areaforgetformarea.set_data_id then
		self.areaforgetformarea:set_data_id(data)
	end
				
end


forgetformFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaforgetformarea.set_data then
		self.areaforgetformarea:set_data(data)
	end
			
end




forgetformFrame.on_show = function(self)
			
	if self.areaforgetformarea.on_show then
		self.areaforgetformarea:on_show()
	end
			
end


forgetformFrame.on_hide = function(self)
			
	if self.areaforgetformarea.on_hide then
		self.areaforgetformarea:on_hide()
	end		
			
end

	


	