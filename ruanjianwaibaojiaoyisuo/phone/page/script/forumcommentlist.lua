
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

forumcommentlistFrame = inherit(GmBase.FrameBase):name("forumcommentlistFrame")

forumcommentlistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forumcommentlist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areaforumcommentlistarea
	self.areaforumcommentlistarea = gm_ruanjianwaibaojiaoyisuo.forumcommentlistareaArea(self)
	
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
			self.areanav:set_title('forumcommentlist')
		elseif self.areanav.set then
			self.areanav:set('title','forumcommentlist')
		end
					
	
	self.mainarea = self.areaforumcommentlistarea
	
	self:set_style('display:none')

	
end


forumcommentlistFrame.set_data_id = function(self,data)
	
	if self.areaforumcommentlistarea.set_data_id then
		self.areaforumcommentlistarea:set_data_id(data)
	end
				
end


forumcommentlistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areaforumcommentlistarea.set_data then
		self.areaforumcommentlistarea:set_data(data)
	end
			
end




forumcommentlistFrame.on_show = function(self,key)
	if self.mainarea.on_show then
		self.mainarea:on_show(key)
	end
end


forumcommentlistFrame.on_hide = function(self,key)
	if self.mainarea.on_hide then
		self.mainarea:on_hide(key)
	end
end


	


	