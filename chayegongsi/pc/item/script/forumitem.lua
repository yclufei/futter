

-- D:\GOA\reslibrary\templete\default\phone\item\forumitem\lua.xsl
gr_module("gm_chayegongsi")

forumitemItem = inherit(GmCtrl.ControlBase):name("forumitemItem")

forumitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "forumitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	
  
	self.fid = self:get_child("fid")
	
  
	--self.sortid = self:get_child("sortid")
	
  
	--self.selectsortid = self:get_child("selectsortid")
	
  
	--self.tid = self:get_child("tid")
	
  
	self.avatar = self:get_child("avatar")	
	self.avatar.set_inner_text = function(ctrl,src)
			ctrl:set_style("background-image:url('"..src.."')")
	end
	self.avatarclick = self:get_child("avatarclick")
	self.avatarclick:set_click(function(ctrl)
		self.hostWindow:exec_action(ctrl ,'ursdetail', top.data)
	end)
	
  
	self.pic = self:get_child("pic")	
	self.pic.set_inner_text = function(ctrl,src)
		ctrl:set_src(src)
	end
	self.pic:set_click(function(ctrl)
		self.hostWindow:exec_action(ctrl ,'foruminfo', top.data)
	end)
	
  
	--self.thumbpath = self:get_child("thumbpath")
	
  
	--self.summary = self:get_child("summary")
	
  
	self.author = self:get_child("author")
	
  
	--self.authorid = self:get_child("authorid")
	
  
	self.subject = self:get_child("subject")
	self.subject.set_inner_text = function(ctrl,src)
		GmBase.Node.set_inner_text(ctrl,unescape(src))
	end
	self.subject:set_click(function(ctrl)
		self.hostWindow:exec_action(ctrl ,'foruminfo', top.data)
	end)
	
  
	self.dateline = self:get_child("dateline")	
	self.dateline.set_inner_text = function(ctrl,src)
			local now = os.date("%Y-%m-%d %H:%M:%S", tonumber(src))
			GmBase.Node.set_inner_text(ctrl,now)
	end
	
  
	self.message = self:get_child("message")
	self.message.set_inner_text = function(ctrl,src)
		GmBase.Node.set_inner_text(ctrl,unescape(src))
	end
	self.message:set_click(function(ctrl)
		self.hostWindow:exec_action(ctrl ,'forumdetail', top.data)
	end)
	
  
	--self.anonymous = self:get_child("anonymous")
	
  
	--self.attachment = self:get_child("attachment")
	
  
	--self.status = self:get_child("status")
	
  
	--self.comment = self:get_child("comment")
	
  
	--self.position = self:get_child("position")
	
  
	--self.special = self:get_child("special")
	
  
	--self.uid = self:get_child("uid")
	
  
	--self.rewardprice = self:get_child("rewardprice")
	
  
	--self.posttime = self:get_child("posttime")
	

	
end


forumitemItem.set_data = function(self,data)
	--table.print(data)
	self.data = data
	
	if data['fid'] and self.fid then
		self.fid:set_inner_text(tostring(data['fid']))
	end
	
	if data['sortid'] and self.sortid then
		self.sortid:set_inner_text(tostring(data['sortid']))
	end
	
	if data['selectsortid'] and self.selectsortid then
		self.selectsortid:set_inner_text(tostring(data['selectsortid']))
	end
	
	if data['tid'] and self.tid then
		self.tid:set_inner_text(tostring(data['tid']))
	end
	
	if data['avatar'] and self.avatar then
		self.avatar:set_inner_text(tostring(data['avatar']))
	end
	
	if data['pic'] and self.pic then
		self.pic:set_inner_text(tostring(data['pic']))
	end
	
	if data['thumbpath'] and self.thumbpath then
		self.thumbpath:set_inner_text(tostring(data['thumbpath']))
	end
	
	if data['summary'] and self.summary then
		self.summary:set_inner_text(tostring(data['summary']))
	end
	
	if data['author'] and self.author then
		self.author:set_inner_text(tostring(data['author']))
	end
	
	if data['authorid'] and self.authorid then
		self.authorid:set_inner_text(tostring(data['authorid']))
	end
	
	if data['subject'] and self.subject then
		self.subject:set_inner_text(tostring(data['subject']))
	end
	
	if data['dateline'] and self.dateline then
		self.dateline:set_inner_text(tostring(data['dateline']))
	end
	
	if data['message'] and self.message then
		self.message:set_inner_text(tostring(data['message']))
	end
	
	if data['anonymous'] and self.anonymous then
		self.anonymous:set_inner_text(tostring(data['anonymous']))
	end
	
	if data['attachment'] and self.attachment then
		self.attachment:set_inner_text(tostring(data['attachment']))
	end
	
	if data['status'] and self.status then
		self.status:set_inner_text(tostring(data['status']))
	end
	
	if data['comment'] and self.comment then
		self.comment:set_inner_text(tostring(data['comment']))
	end
	
	if data['position'] and self.position then
		self.position:set_inner_text(tostring(data['position']))
	end
	
	if data['special'] and self.special then
		self.special:set_inner_text(tostring(data['special']))
	end
	
	if data['uid'] and self.uid then
		self.uid:set_inner_text(tostring(data['uid']))
	end
	
	if data['rewardprice'] and self.rewardprice then
		self.rewardprice:set_inner_text(tostring(data['rewardprice']))
	end
	
	if data['posttime'] and self.posttime then
		self.posttime:set_inner_text(tostring(data['posttime']))
	end
	
end


	