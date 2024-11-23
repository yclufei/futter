gr_module("GmSql")

set = inherit(GmSql.field):name("set")

set.init = function(self)
	GmSql.field.init(self)
	self.m_Dirty = true	
	self.m_Attrs = {}	
	self.m_List = {}
	self.m_Pages = {}
	self.m_RecordCount = -10	
	self.m_RecordCounts = {}
	self.m_online = false
end


set.SetOnline = function(self,bl)
	self.m_online = bl
end


set.GetOnline = function(self)
	return self.m_online
end

set.SetPageDirty = function(self,bl)
	if bl then
		self.m_List = {}
		self.m_Pages = {}
		self.m_RecordCount = -10	
		self.m_RecordCounts = {}
	end	
	self.m_Dirty = bl
end

set.SetDirty = function(self,bl)
	if bl then
		self.m_Attrs = {}	
		self.m_List = {}
		self.m_Pages = {}
		self.m_RecordCount = -10	
		self.m_RecordCounts = {}
	end	
	self.m_Dirty = bl
end


set.GetDirty = function(self)
	return self.m_Dirty 
end


set.GetAttrs = function(self)
	return self.m_Attrs
end


set.GetAttr = function(self,name)
	return self.m_Attrs[name]
end


set.SetAttrs = function(self,tb)
	if tb then
		for name,value in pairs(tb) do
			if type(value) == 'table' then
				self:SetChildTableAttrs(name,value)
			elseif value ~= "" then
				self:SetAttr(name,value)
			end
		end
	end
	return self
end


set.SetChildTableAttrs = function(self,front,tb)
	if tb then
		for name,value in pairs(tb) do
			if type(value) == 'table' then
				self:SetChildTableAttrs(front..'_'..name,value)
			elseif value ~= "" then
				self:SetAttr(front..'_'..name,value)
			end
		end
	end
	return self
end



set.GetNumAttr = function(self,name)
	return tonumber( self.m_Attrs[name] )
end

set.SetNumAttr = function(self,name,value)
	self.m_Attrs[name] = tonumber( value )
	return self
end

set.ClearAttrs = function(self)
	self.m_Attrs = {}
end

set.ClearAttr = function(self,name)
	self.m_Attrs[name] = nil
	return self
end


set.SetAttr = function(self,name,value)
	---print('set.SetAttr',name,value)
	local fa = self:GetFields(self.tablename)
	if fa then
		local field = fa[name]
		if field ~= nil then
			if field == 1 then
				self.m_Attrs[name] = tonumber( value )
			else
				self.m_Attrs[name] = tostring( value )
			end	
		else
			print(self.tablename,"没有这属性",name)
		end
	end
	return self
end

set.SetAttrsDirect = function(self,tb)
	if tb then
		for name,value in pairs(tb) do
			if value ~= "" then
				self:SetAttrDirect(name,value)
			end
		end
	end
	return self
end

set.SetAttrDirect = function(self,name,value)
	self.m_Attrs[name] = value
	return self
end

