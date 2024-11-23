

gr_module("gm_chayegongsi")

productitemItem = inherit(GmCtrl.ControlBase):name("productitemItem")

productitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "productitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	
  
	self.selectsortid = self:get_child("selectsortid")
	
  
	self.sortid = self:get_child("sortid")
	
  
	self.subject = self:get_child("subject")
	self.subject.set_inner_text = function(ctrl,src)
		GmBase.Node.set_inner_text(ctrl,unescape(src))
	end
	self.subject:set_click(function(ctrl)
		self.hostWindow:exec_action(ctrl ,'productinfo', top.data)
	end)
	
  
  
	self.pid = self:get_child("pid")
	
  
	self.fid = self:get_child("fid")
	
  
	self.tid = self:get_child("tid")
	
  
	self.avatar = self:get_child("avatar")
	
  
  
	self.thumbpath = self:get_child("thumbpath")
	
  
	self.summary = self:get_child("summary")
	
  
	self.first = self:get_child("first")
	
  
	self.author = self:get_child("author")
	
  
	self.authorid = self:get_child("authorid")
	
  
	self.dateline = self:get_child("dateline")	
	self.dateline.set_inner_text = function(ctrl,src)
			local now = os.date("%Y-%m-%d %H:%M:%S", tonumber(src))
			GmBase.Node.set_inner_text(ctrl,now)
	end
	
  
	self.invisible = self:get_child("invisible")
	
  
	self.attachment = self:get_child("attachment")
	
  
	self.status = self:get_child("status")
	
  
	self.comment = self:get_child("comment")
	
  
	self.position = self:get_child("position")
	
  
	self.special = self:get_child("special")
	
  
	self.uid = self:get_child("uid")
	
  
	self.rewardprice = self:get_child("rewardprice")
	

	
end


productitemItem.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	