
	--[[
	self:SetAttr('name','lufei')
	self:SetAttr('phone','18802525783')
	
	print( self:GetLimitChildSql(0,10) )
	print( self:GetRecordCountChildSql() )
	print( self:GetUpdateChildSql() )
	print( self:GetWhereChildSql() )
	
	a,b = self:GetFieldValues()
	print( a )
	print( b )
	
	a,b = self:GetMuiltSelectSqlStr() 
	print( a )
	print( b )
	]]



gr_module("GmBase")


Contactor = inherit(GmSql.list):name("Contactor")


-- ≥ı ºªØ
Contactor.init = function (self)

	GmSql.list.init(self)
	
	self.dbname = gInfo.path..'/framesys'
	self.tablename = 'address'
		
	self:initTableStruct()
	
end


Contactor.init_data = function(self)

end


Contactor.get_data = function(self,page,pagecount)
	local result = {}
	
	self:SetAttr('followed',0)
	
	result['data'] = self:GetPage2(nil,page,pagecount)
	
	result['pageinfo'] = { ['page'] = page }
	
	return result
end
