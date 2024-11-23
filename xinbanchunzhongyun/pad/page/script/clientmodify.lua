
		
-- D:\GOA\reslibrary\templete\res\page\page.pad.lua.xsl
gr_module("gm_xinbanchunzhongyun")

clientmodifyFrame = inherit(GmBase.FrameBase):name("clientmodifyFrame")

clientmodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_clientmodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areaclientmodifyarea
	self.areaclientmodifyarea = gm_xinbanchunzhongyun.clientmodifyareaArea(self)
	
	if self.areaclientmodifyarea.set then
				
	end
	
		if self.areaclientmodifyarea.set_title then
			self.areaclientmodifyarea:set_title('编辑客户')
		elseif self.areaclientmodifyarea.set then
			self.areaclientmodifyarea:set('title','编辑客户')
		end
					
	
	self.mainarea = self.areaclientmodifyarea
	
	self:set_style('display:none')

	
end


clientmodifyFrame.set_data_id = function(self,data)
	
	if self.areaclientmodifyarea.set_data_id then
		self.areaclientmodifyarea:set_data_id(data)
	end
				
end


clientmodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areaclientmodifyarea.set_data then
		self.areaclientmodifyarea:set_data(data)
	end
			
end




clientmodifyFrame.on_show = function(self)
			
	if self.areaclientmodifyarea.on_show then
		self.areaclientmodifyarea:on_show()
	end
			
end


clientmodifyFrame.on_hide = function(self)
			
	if self.areaclientmodifyarea.on_hide then
		self.areaclientmodifyarea:on_hide()
	end		
			
end

	


	