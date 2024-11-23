

gr_module("gm_xinbanchunzhongyun")

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
	
	if data['selectsortid'] and self.selectsortid and self.selectsortid:is_init() then
		self.selectsortid:set_inner_text(tostring(data['selectsortid']))
	end
	
	if data['sortid'] and self.sortid and self.sortid:is_init() then
		self.sortid:set_inner_text(tostring(data['sortid']))
	end
	
	if data['subject'] and self.subject and self.subject:is_init() then
		self.subject:set_inner_text(tostring(data['subject']))
	end
	
	if data['message'] and self.message and self.message:is_init() then
		self.message:set_inner_text(tostring(data['message']))
	end
	
	if data['pid'] and self.pid and self.pid:is_init() then
		self.pid:set_inner_text(tostring(data['pid']))
	end
	
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
	
	if data['first'] and self.first and self.first:is_init() then
		self.first:set_inner_text(tostring(data['first']))
	end
	
	if data['author'] and self.author and self.author:is_init() then
		self.author:set_inner_text(tostring(data['author']))
	end
	
	if data['authorid'] and self.authorid and self.authorid:is_init() then
		self.authorid:set_inner_text(tostring(data['authorid']))
	end
	
	if data['dateline'] and self.dateline and self.dateline:is_init() then
		self.dateline:set_inner_text(tostring(data['dateline']))
	end
	
	if data['invisible'] and self.invisible and self.invisible:is_init() then
		self.invisible:set_inner_text(tostring(data['invisible']))
	end
	
	if data['attachment'] and self.attachment and self.attachment:is_init() then
		self.attachment:set_inner_text(tostring(data['attachment']))
	end
	
	if data['status'] and self.status and self.status:is_init() then
		self.status:set_inner_text(tostring(data['status']))
	end
	
	if data['comment'] and self.comment and self.comment:is_init() then
		self.comment:set_inner_text(tostring(data['comment']))
	end
	
	if data['position'] and self.position and self.position:is_init() then
		self.position:set_inner_text(tostring(data['position']))
	end
	
	if data['special'] and self.special and self.special:is_init() then
		self.special:set_inner_text(tostring(data['special']))
	end
	
	if data['uid'] and self.uid and self.uid:is_init() then
		self.uid:set_inner_text(tostring(data['uid']))
	end
	
	if data['rewardprice'] and self.rewardprice and self.rewardprice:is_init() then
		self.rewardprice:set_inner_text(tostring(data['rewardprice']))
	end
	
end


	