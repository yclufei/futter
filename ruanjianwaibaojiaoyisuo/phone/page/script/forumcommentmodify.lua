
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

forumcommentmodifyFrame = inherit(GmBase.FrameBase):name("forumcommentmodifyFrame")

forumcommentmodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forumcommentmodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- mainarea
	self.mainarea = gm_ruanjianwaibaojiaoyisuo.forumcommentmodifyareaArea(self)
	
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
			self.areanav:set_title('forumcommentmodify')
		elseif self.areanav.set then
			self.areanav:set('title','forumcommentmodify')
		end
			
	local rcss = 'fa_save font45 paddingTop15'
	self.areanav:set('rightcss',rcss)
	
	self.areanav.rightfunc = function(link)
		top.mainarea:save()
	end		
	
	
	self:set_style('display:none')

	
end


forumcommentmodifyFrame.set_data_id = function(self,data)
	
	if self.mainarea.set_data_id then
		self.mainarea:set_data_id(data)
	end
				
end


forumcommentmodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.mainarea.set_data then
		self.mainarea:set_data(data)
	end
			
end




forumcommentmodifyFrame.on_show = function(self)
			
	if self.mainarea.on_show then
		self.mainarea:on_show()
	end
			
end


forumcommentmodifyFrame.on_hide = function(self)
			
	if self.mainarea.on_hide then
		self.mainarea:on_hide()
	end		
			
end

	


	