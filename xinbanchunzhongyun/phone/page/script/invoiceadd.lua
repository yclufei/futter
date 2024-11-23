
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

invoiceaddFrame = inherit(GmBase.FrameBase):name("invoiceaddFrame")

invoiceaddFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_invoiceadd"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areainvoiceaddarea
	self.areainvoiceaddarea = gm_xinbanchunzhongyun.invoiceaddareaArea(self)
	
	if self.areainvoiceaddarea.set then
				
	end
	
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
			self.areanav:set_title('添加出货单')
		elseif self.areanav.set then
			self.areanav:set('title','添加出货单')
		end
					
		if self.areainvoiceaddarea.set_title then
			self.areainvoiceaddarea:set_title('添加出货单')
		elseif self.areainvoiceaddarea.set then
			self.areainvoiceaddarea:set('title','添加出货单')
		end
					
	
	self.mainarea = self.areainvoiceaddarea
	
	self:set_style('display:none')

	
end


invoiceaddFrame.set_data_id = function(self,data)
	
	if self.areainvoiceaddarea.set_data_id then
		self.areainvoiceaddarea:set_data_id(data)
	end
				
end


invoiceaddFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areainvoiceaddarea.set_data then
		self.areainvoiceaddarea:set_data(data)
	end
			
end




invoiceaddFrame.on_show = function(self)
			
	if self.areainvoiceaddarea.on_show then
		self.areainvoiceaddarea:on_show()
	end
			
end


invoiceaddFrame.on_hide = function(self)
			
	if self.areainvoiceaddarea.on_hide then
		self.areainvoiceaddarea:on_hide()
	end		
			
end

	


	