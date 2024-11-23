
gr_module("GmBase")

formExtendArea = inherit(GmCtrl.ControlBase):name("formExtendArea")

formExtendArea.init = function(self,parent,fname)

	local top = self
	self.parent = parent
	
	local fid = fname or "formextendarea"
	
	GmCtrl.ControlBase.init(self,parent,fid)
	
	self.inputs = GmCtrl.freeCtrolCtrl(self,'inputitem')
	self.selects = GmCtrl.freeCtrolCtrl(self,'selectitem')
	
	self.net = GmBase.discuznet.get_instance()
	self.netmethon = 'threadsort'	
	GmBase.discuznet.get_instance():add_callback('discuznet.threadsort',self)	

end


formExtendArea.get_text = function(self,key)
	if self[key] and type(self[key]) == 'table' and self[key].get_text then
		return self[key]:get_text()
	end
	return nil
end



formExtendArea.callback =  function(self,callbackey,tbname,postparam,netdata,sortkey,ids)
	local top = self
	self:clean()
	--table.print(netdata['data'])
	for k,v in pairs(netdata['data']) do
		if v.type == 'text' then
			if self[v.identifier] == nil then
				local refnode = self.inputs:new_item(v.identifier)
				refnode:releaseRef()
				self[v.identifier] = GmCtrl.ItemInputCtrl(self,v.identifier,v.title, ' ',		function(k,v,c)  c:set(k,v)  end)
			else
				self.inputs:set_item(v.identifier)
				self[v.identifier]:set_visible(true)
			end
		elseif v.type == 'select' then		
			local sdata = {}
			for a,b in pairs(v.choices) do
				local k = b.optionid
				local v = b.content
				sdata[k] = v
			end
			if self[v.identifier] == nil then
				local refnode = self.selects:new_item(v.identifier)
				refnode:releaseRef()				
				self[v.identifier] = GmCtrl.ItemSelectCtrl(self,v.identifier,v.title, sdata,		function(k,v,c)  c:set(k,v)  end)				
			else
				self.selects:set_item(v.identifier)
				self[v.identifier]:set_visible(true)
			end
		elseif v.type == 'radio' then
			if self[v.identifier] == nil then
				local refnode = self.selects:new_item(v.identifier)
				refnode:releaseRef()				
				self[v.identifier] = GmCtrl.ItemSelectCtrl(self,v.identifier,v.title, v.choices,		function(k,v,c)  c:set(k,v)  end)				
			else
				self.selects:set_item(v.identifier)
				self[v.identifier]:set_visible(true)
			end
		end
	end
	self:layout()
	self:updatetick()
end


formExtendArea.clean = function(self)
	self.inputs:clean()
	self.selects:clean()
end



formExtendArea.set_data = function(self,id)	
	self:clean()
	local tb,key,param = self.net:threadsort()
	param.sortid = id
	self.net:threadsort(param)
end


