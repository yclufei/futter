

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
	
	if data['fid'] and self.fid and self.fid:is_init() then
		self.fid:set_inner_text(tostring(data['fid']))
	end
	
	if data['tid'] and self.tid and self.tid:is_init() then
		self.tid:set_inner_text(tostring(data['tid']))
	end
	
	if data['avatar'] and self.avatar and self.avatar:is_init() then
		self.avatar:set_inner_text(tostring(data['avatar']))
	end
	
	if data['pic'] and self.pic and self.pic:is_init() then
		self.pic:set_inner_text(tostring(data['pic']))
	end
	
	if data['thumbpath'] and self.thumbpath and self.thumbpath:is_init() then
		self.thumbpath:set_inner_text(tostring(data['thumbpath']))
	end
	
	if data['summary'] and self.summary and self.summary:is_init() then
		self.summary:set_inner_text(tostring(data['summary']))
	end
	
	if data['author'] and self.author and self.author:is_init() then
		self.author:set_inner_text(tostring(data['author']))
	end
	
	if data['authorid'] and self.authorid and self.authorid:is_init() then
		self.authorid:set_inner_text(tostring(data['authorid']))
	end
	
	if data['subject'] and self.subject and self.subject:is_init() then
		self.subject:set_inner_text(tostring(data['subject']))
	end
	
	if data['dateline'] and self.dateline and self.dateline:is_init() then
		self.dateline:set_inner_text(tostring(data['dateline']))
	end
	
	if data['message'] and self.message and self.message:is_init() then
		self.message:set_inner_text(tostring(data['message']))
	end
	
	if data['status'] and self.status and self.status:is_init() then
		self.status:set_inner_text(tostring(data['status']))
	end
	
end


	