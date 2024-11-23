	
-- area.pc.lua.xsl
					
gr_module("gm_chayegongsi")

commentlistareaArea = inherit(GmCtrl.ControlBase):name("commentlistareaArea")

commentlistareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "commentlistareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )

						
	
	self:init_attrs()
	
	
		
		
	



	self.is_init_data = false
	
end


commentlistareaArea.on_show = function(self,key)
	if self.is_init_data == false then
		self:init_net_data()	
		self.is_init_data = true
	end
end





commentlistareaArea.init_attrs = function(self)
	
	
	if self._ID == 'objectlistarea' then
		self:set_attr('list_source',self.parent._ID)
	else
		self:set_attr('list_source',self._ID)
	end
end
	


