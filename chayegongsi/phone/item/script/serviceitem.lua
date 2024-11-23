

gr_module("gm_chayegongsi")

serviceitemItem = inherit(GmCtrl.ControlBase):name("serviceitemItem")

serviceitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "serviceitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	
  
	self.fid = self:get_child("fid")
	
  
	self.tid = self:get_child("tid")
	
  
	self.avatar = self:get_child("avatar")
	
  
  
	self.thumbpath = self:get_child("thumbpath")
	
  
	self.summary = self:get_child("summary")
	
  
	self.author = self:get_child("author")
	
  
	self.authorid = self:get_child("authorid")
	
  
	self.subject = self:get_child("subject")
	self.subject.set_inner_text = function(ctrl,src)
		GmBase.Node.set_inner_text(ctrl,unescape(src))
	end
	self.subject:set_click(function(ctrl)
		self.hostWindow:exec_action(ctrl ,'serviceinfo', top.data)
	end)
	
  
	self.dateline = self:get_child("dateline")	
	self.dateline.set_inner_text = function(ctrl,src)
			local now = os.date("%Y-%m-%d %H:%M:%S", tonumber(src))
			GmBase.Node.set_inner_text(ctrl,now)
	end
	
  
  
	self.status = self:get_child("status")
	

	
end


serviceitemItem.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	