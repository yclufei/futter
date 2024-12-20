
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_xinbanchunzhongyun")

invoicemodifyFrame = inherit(GmBase.FrameBase):name("invoicemodifyFrame")

invoicemodifyFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_invoicemodify"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	-- areanav
	self.areanav = gm_xinbanchunzhongyun.navArea(self)
	
	-- areainvoicemodifyarea
	self.areainvoicemodifyarea = gm_xinbanchunzhongyun.invoicemodifyareaArea(self)
	
	if self.areainvoicemodifyarea.set then
				
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
			self.areanav:set_title('编辑出货单')
		elseif self.areanav.set then
			self.areanav:set('title','编辑出货单')
		end
					
		if self.areainvoicemodifyarea.set_title then
			self.areainvoicemodifyarea:set_title('编辑出货单')
		elseif self.areainvoicemodifyarea.set then
			self.areainvoicemodifyarea:set('title','编辑出货单')
		end
					
	
	self.mainarea = self.areainvoicemodifyarea
	
	self:set_style('display:none')

	
end


invoicemodifyFrame.set_data_id = function(self,data)
	
	if self.areainvoicemodifyarea.set_data_id then
		self.areainvoicemodifyarea:set_data_id(data)
	end
				
end


invoicemodifyFrame.set_data = function(self,data)

	self.data = data
	
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.areainvoicemodifyarea.set_data then
		self.areainvoicemodifyarea:set_data(data)
	end
			
end




invoicemodifyFrame.on_show = function(self)
			
	if self.areainvoicemodifyarea.on_show then
		self.areainvoicemodifyarea:on_show()
	end
			
end


invoicemodifyFrame.on_hide = function(self)
			
	if self.areainvoicemodifyarea.on_hide then
		self.areainvoicemodifyarea:on_hide()
	end		
			
end

	


	