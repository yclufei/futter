
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

forumlistFrame = inherit(GmBase.FrameBase):name("forumlistFrame")

forumlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forumlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- mainarea
	self.mainarea = gm_ruanjianwaibaojiaoyisuo.forumlistareaArea(self)

	if self.areanav.set_left then
		self.areanav:set_left('back')
	elseif self.areanav.set then
		self.areanav:set('left','back')
	end
				
	if self.areanav.set_leftcss then
		self.areanav:set_leftcss('fa-angle-left font45')
	elseif self.areanav.set then
		self.areanav:set('leftcss','fa-angle-left font45')
	end
				
	if self.areanav.set_title then
		self.areanav:set_title('forumlist')
	elseif self.areanav.set then
		self.areanav:set('title','forumlist')
	end
					
	
	self:set_style('display:none')

	
end


forumlistFrame.set_data_id = function(self,data)
	
	if self.mainarea.set_data_id then
		self.mainarea:set_data_id(data)
	end
				
end


forumlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.mainarea.set_data then
		self.mainarea:set_data(data)
	end
			
end




forumlistFrame.on_show = function(self,key)
	if self.mainarea.on_show then
		self.mainarea:on_show(key)
	end
end


forumlistFrame.on_hide = function(self,key)
	if self.mainarea.on_hide then
		self.mainarea:on_hide(key)
	end
end

	


	