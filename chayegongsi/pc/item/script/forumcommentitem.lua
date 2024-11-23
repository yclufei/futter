

-- D:\GOA\reslibrary\templete\default\phone\item\forumcommentitem\lua.xsl
gr_module("gm_chayegongsi")

forumcommentitemItem = inherit(GmCtrl.ControlBase):name("forumcommentitemItem")

forumcommentitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "forumcommentitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	
  
	self.fid = self:get_child("fid")
	
  
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
	
  
	--self.first = self:get_child("first")
	
  
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
	
  
	--self.useip = self:get_child("useip")
	
  
	--self.port = self:get_child("port")
	
  
	--self.invisible = self:get_child("invisible")
	
  
	--self.anonymous = self:get_child("anonymous")
	
  
	--self.usesig = self:get_child("usesig")
	
  
	--self.htmlon = self:get_child("htmlon")
	
  
	--self.bbcodeoff = self:get_child("bbcodeoff")
	
  
	--self.smileyoff = self:get_child("smileyoff")
	
  
	--self.parseurloff = self:get_child("parseurloff")
	
  
	--self.attachment = self:get_child("attachment")
	
  
	--self.ratetimes = self:get_child("ratetimes")
	
  
	--self.status = self:get_child("status")
	
  
	--self.tags = self:get_child("tags")
	
  
	--self.comment = self:get_child("comment")
	
  
	--self.replycredit = self:get_child("replycredit")
	
  
	--self.position = self:get_child("position")
	

	
end


forumcommentitemItem.set_data = function(self,data)
	--table.print(data)
	self.data = data
	
	if data['fid'] and self.fid then
		self.fid:set_inner_text(tostring(data['fid']))
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
	
	if data['first'] and self.first then
		self.first:set_inner_text(tostring(data['first']))
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
	
	if data['useip'] and self.useip then
		self.useip:set_inner_text(tostring(data['useip']))
	end
	
	if data['port'] and self.port then
		self.port:set_inner_text(tostring(data['port']))
	end
	
	if data['invisible'] and self.invisible then
		self.invisible:set_inner_text(tostring(data['invisible']))
	end
	
	if data['anonymous'] and self.anonymous then
		self.anonymous:set_inner_text(tostring(data['anonymous']))
	end
	
	if data['usesig'] and self.usesig then
		self.usesig:set_inner_text(tostring(data['usesig']))
	end
	
	if data['htmlon'] and self.htmlon then
		self.htmlon:set_inner_text(tostring(data['htmlon']))
	end
	
	if data['bbcodeoff'] and self.bbcodeoff then
		self.bbcodeoff:set_inner_text(tostring(data['bbcodeoff']))
	end
	
	if data['smileyoff'] and self.smileyoff then
		self.smileyoff:set_inner_text(tostring(data['smileyoff']))
	end
	
	if data['parseurloff'] and self.parseurloff then
		self.parseurloff:set_inner_text(tostring(data['parseurloff']))
	end
	
	if data['attachment'] and self.attachment then
		self.attachment:set_inner_text(tostring(data['attachment']))
	end
	
	if data['ratetimes'] and self.ratetimes then
		self.ratetimes:set_inner_text(tostring(data['ratetimes']))
	end
	
	if data['status'] and self.status then
		self.status:set_inner_text(tostring(data['status']))
	end
	
	if data['tags'] and self.tags then
		self.tags:set_inner_text(tostring(data['tags']))
	end
	
	if data['comment'] and self.comment then
		self.comment:set_inner_text(tostring(data['comment']))
	end
	
	if data['replycredit'] and self.replycredit then
		self.replycredit:set_inner_text(tostring(data['replycredit']))
	end
	
	if data['position'] and self.position then
		self.position:set_inner_text(tostring(data['position']))
	end
	
end


	