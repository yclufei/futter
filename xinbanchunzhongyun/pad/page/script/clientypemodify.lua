
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

clientypemodifyFrame = inherit(GmBase.FrameBase):name("clientypemodifyFrame")

clientypemodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_clientypemodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaclientypemodifyarea
	self.areaclientypemodifyarea = gm_xinbanchunzhongyun.clientypemodifyareaArea(self)
	
	if self.areaclientypemodifyarea.set then
				
	end
	
		if self.areaclientypemodifyarea.set_title then
			self.areaclientypemodifyarea:set_title('客户分类编辑')
		elseif self.areaclientypemodifyarea.set then
			self.areaclientypemodifyarea:set('title','客户分类编辑')
		end
					
	
	self.mainarea = self.areaclientypemodifyarea
	
	self:set_style('display:none')

	
end


clientypemodifyFrame.set_data_id = function(self,data)
	
	if self.areaclientypemodifyarea.set_data_id then
		self.areaclientypemodifyarea:set_data_id(data)
	end
				
end


clientypemodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaclientypemodifyarea.set_data then
		self.areaclientypemodifyarea:set_data(data)
	end
			
end




clientypemodifyFrame.on_show = function(self)
			
	if self.areaclientypemodifyarea.on_show then
		self.areaclientypemodifyarea:on_show()
	end
			
end


clientypemodifyFrame.on_hide = function(self)
			
	if self.areaclientypemodifyarea.on_hide then
		self.areaclientypemodifyarea:on_hide()
	end		
			
end

	


	