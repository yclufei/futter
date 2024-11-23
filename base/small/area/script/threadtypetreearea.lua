
-- D:\GOA\reslibrary\templete\default\pc\area\threadtypetreearea\lua.xsl
gr_module("GmBase")

threadtypetreeareaArea = inherit(GmCtrl.ControlBase):name("threadtypetreeareaArea")

threadtypetreeareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "threadtypetreearea"
	GmCtrl.ControlBase.init(self,parent,fid)

	
	self.inititem = self:get_child('inititem')
	
	self.items = {}
	
	self.init_content = false
	
end


threadtypetreeareaArea.callback = function(self,callbackey,tbname,postparam,data,sortkey,ids)
	if self.init_content == false and self.net.classname..'.'..self.netmethon == callbackey then	
	
		print("######### threadtypetreeareaArea.callback",callbackey,tbname,postparam,data,sortkey,ids)	
		table.print(postparam)
		table.print(data)
	
		local attrs = self:GetAttrs()
		
		for k,v in pairs(attrs) do
			if postparam[k] ~= v then
				print('threadtypetreeareaArea.callback quit',k, postparam[k] , v)
				return
			end
		end
		
		
		for k,v in pairs(data.data['choices']) do		
			self.items[k] = self.inititem:copy()
			self.items[k].title = self.items[k]:get_child('title')
			self.items[k].children = self.items[k]:get_child('children')
			self.items[k].title:set_inner_text(v['content'])			
			self.items[k]:set_style('display:block')
		end
		
		for k,v in pairs(data.data['choices']) do
			local foptionid = v['foptionid']
			if foptionid == '0' then
				self.items[k]:set_parent(self)
			else
				self.items[k]:set_parent(self.items[foptionid].children)
			end
		end
		
		self.init_content = true
		
		return true
	end
	return false
end


threadtypetreeareaArea.set_data = function(self,data)

end



	
	
	