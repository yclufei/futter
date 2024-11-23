

gr_module("gm_ruanjianwaibaojiaoyisuo")

serviceitemItem = inherit(GmCtrl.ControlBase):name("serviceitemItem")

serviceitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "serviceitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.itemctrl = GmCtrl.ItemFieldCtrl(self)
	
	self.ItemHead = GmCtrl.ItemHeadCtrl(self,'serviceinfo')
	
	
  
	self.fid = self:get_child("fid")
	
	self.tid = self:get_child("tid")
	
	self.thumbpath = self:get_child("thumbpath")
	
	self.summary = self:get_child("summary")
	
	self.authorid = self:get_child("authorid")
	
  self.pic = self:get_child("mainpic")
  self.pic.set_inner_text = function(ctrl,path)
  	if path and string.len(path) > 3 then
	  	local src = g_serverRoot..'discuz/upload/'..path
	  	ctrl:set_src(src)
  	end
  end
  
	self.dateline = self:get_child("dateline")	
	self.dateline.set_inner_text = function(ctrl,src)
			local now = os.date("%Y-%m-%d %H:%M:%S", tonumber(src))
			GmBase.Node.set_inner_text(ctrl,now)
	end
	
	self.status = self:get_child("status")

end


serviceitemItem.set_data = function(self,data)

	if data then
		self.data = data
	end
	
	--table.print(data)
	
	if data['data'] then
		local itemdata = StringToTable( data['data'] )
		for k,v in pairs(itemdata) do
			self.data[k] = v
		end
	end
	
	self:set_childs_inner_text(self.data)

	self.itemctrl:set_data(self.data)
	self.ItemHead:set_data(self.data)
	
	for a,b in pairs(self.data) do
		if data[a] and self[a] and type(self[a]) == 'table' and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(self.data[a]))
		end
	end	
	
end


	