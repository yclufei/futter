
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

threadtypelistFrame = inherit(GmBase.FrameBase):name("threadtypelistFrame")

threadtypelistFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_threadtypelist"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	-- areathreadtypelistarea
	self.areathreadtypelistarea = gm_ruanjianwaibaojiaoyisuo.threadtypelistareaArea(self)
	
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
			self.areanav:set_title('threadtypelist')
		elseif self.areanav.set then
			self.areanav:set('title','threadtypelist')
		end
					
	
	self.mainarea = self.areathreadtypelistarea
	
	self:set_style('display:none')

	
end


threadtypelistFrame.set_data_id = function(self,data)
	
	if self.areathreadtypelistarea.set_data_id then
		self.areathreadtypelistarea:set_data_id(data)
	end
				
end


threadtypelistFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areathreadtypelistarea.set_data then
		self.areathreadtypelistarea:set_data(data)
	end
			
end




threadtypelistFrame.on_show = function(self)
			
	if self.areathreadtypelistarea.on_show then
		self.areathreadtypelistarea:on_show()
	end
			
end


threadtypelistFrame.on_hide = function(self)
			
	if self.areathreadtypelistarea.on_hide then
		self.areathreadtypelistarea:on_hide()
	end		
			
end

	


	