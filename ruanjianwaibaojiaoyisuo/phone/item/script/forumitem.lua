 

-- D:\GOA\reslibrary\templete\default\phone\item\forumitem\lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

forumitemItem = inherit(GmCtrl.ControlBase):name("forumitemItem")

forumitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "forumitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	self.itemurs = GmCtrl.itemUrsHeadArea(self)
	
  
	self.fid = self:get_child("fid")
  
	self.sortid = self:get_child("sortid")
	self.sortid.set_inner_text = function(ctrl,sortid)
		local mgr = gm_ruanjianwaibaojiaoyisuo.clsthreadtypemgr.get_instance()
		mgr:SetAttr('typeid',tostring(sortid))
		local a,b,c = mgr:GetRecordsByAttribute()
		if a and tonumber(b) == 1 then
			GmBase.Node.set_inner_text(ctrl,c[0]['name'])
		else
			GmBase.Node.set_inner_text(ctrl,tostring(sortid))
		end
	end
	
  
	self.pic = self:get_child("pic")	
	self.pic.set_inner_text = function(ctrl,src)
		ctrl:set_src(src)
	end
	self.pic:set_click(function(ctrl)
		self.hostWindow:exec_action(ctrl ,'foruminfo', top.data)
	end)
	
  
	
  
	self.subject = self:get_child("subject")
	self.subject.set_inner_text = function(ctrl,src)
		GmBase.Node.set_inner_text(ctrl,unescape(src))
	end
	self.subject:set_click(function(ctrl)
		self.hostWindow:exec_action(ctrl ,'foruminfo', top.data)
	end)
	
  
  
	
	self.itemctrl = GmCtrl.ItemFieldCtrl(self)

	
end


forumitemItem.set_data = function(self,data)

	self.data = data 
	
	if data['data'] then
		local itemdata = StringToTable( data['data'] )
		for k,v in pairs(itemdata) do
			self.data[k] = v
		end
	end
	
	self:set_childs_inner_text(self.data)
	
	self.itemctrl:set_data(self.data)
	self.itemurs:set_data(self.data)
	
	for a,b in pairs(self.data) do
		if self.data[a] and self[a] and type(self[a]) == 'table' and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(self.data[a]))
		end
	end
	
end


	