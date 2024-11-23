
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

ranklistaddFrame = inherit(GmBase.FrameBase):name("ranklistaddFrame")

ranklistaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_ranklistadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- arearanklistaddarea
	self.arearanklistaddarea = gm_ruanjianwaibaojiaoyisuo.ranklistaddareaArea(self)
	
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
			self.areanav:set_title('ranklistadd')
		elseif self.areanav.set then
			self.areanav:set('title','ranklistadd')
		end
					
	
	self.mainarea = self.arearanklistaddarea
	
	self:set_style('display:none')

	
end


ranklistaddFrame.set_data_id = function(self,data)
	
	if self.arearanklistaddarea.set_data_id then
		self.arearanklistaddarea:set_data_id(data)
	end
				
end


ranklistaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.arearanklistaddarea.set_data then
		self.arearanklistaddarea:set_data(data)
	end
			
end




ranklistaddFrame.on_show = function(self)
			
	if self.arearanklistaddarea.on_show then
		self.arearanklistaddarea:on_show()
	end
			
end


ranklistaddFrame.on_hide = function(self)
			
	if self.arearanklistaddarea.on_hide then
		self.arearanklistaddarea:on_hide()
	end		
			
end

	


	