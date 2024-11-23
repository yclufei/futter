

-- D:\GOA\reslibrary\templete\res\item\item.pad.lua.xsl
gr_module("gm_minjieyingshi")

forumcommentitemItem = inherit(GmCtrl.ControlBase):name("forumcommentitemItem")

forumcommentitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "forumcommentitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.fid = self:get_child("fid")
	
	self.tid = self:get_child("tid")
	
	self.avatar = self:get_child("avatar")
	
	self.pic = self:get_child("pic")
	
	self.thumbpath = self:get_child("thumbpath")
	
	self.summary = self:get_child("summary")
	
	self.first = self:get_child("first")
	
	self.author = self:get_child("author")
	
	self.authorid = self:get_child("authorid")
	
	self.subject = self:get_child("subject")
	
	self.dateline = self:get_child("dateline")
	
	self.message = self:get_child("message")
	
	self.useip = self:get_child("useip")
	
	self.port = self:get_child("port")
	
	self.invisible = self:get_child("invisible")
	
	self.anonymous = self:get_child("anonymous")
	
	self.usesig = self:get_child("usesig")
	
	self.htmlon = self:get_child("htmlon")
	
	self.bbcodeoff = self:get_child("bbcodeoff")
	
	self.smileyoff = self:get_child("smileyoff")
	
	self.parseurloff = self:get_child("parseurloff")
	
	self.attachment = self:get_child("attachment")
	
	self.ratetimes = self:get_child("ratetimes")
	
	self.status = self:get_child("status")
	
	self.tags = self:get_child("tags")
	
	self.comment = self:get_child("comment")
	
	self.replycredit = self:get_child("replycredit")
	
	self.position = self:get_child("position")
	
	
	
end


forumcommentitemItem.set_data = function(self,data)
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
	
		if data['first'] and self.first and self.first:is_init() then
			self.first:set_inner_text(tostring(data['first']))
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
	
		if data['useip'] and self.useip and self.useip:is_init() then
			self.useip:set_inner_text(tostring(data['useip']))
		end
	
		if data['port'] and self.port and self.port:is_init() then
			self.port:set_inner_text(tostring(data['port']))
		end
	
		if data['invisible'] and self.invisible and self.invisible:is_init() then
			self.invisible:set_inner_text(tostring(data['invisible']))
		end
	
		if data['anonymous'] and self.anonymous and self.anonymous:is_init() then
			self.anonymous:set_inner_text(tostring(data['anonymous']))
		end
	
		if data['usesig'] and self.usesig and self.usesig:is_init() then
			self.usesig:set_inner_text(tostring(data['usesig']))
		end
	
		if data['htmlon'] and self.htmlon and self.htmlon:is_init() then
			self.htmlon:set_inner_text(tostring(data['htmlon']))
		end
	
		if data['bbcodeoff'] and self.bbcodeoff and self.bbcodeoff:is_init() then
			self.bbcodeoff:set_inner_text(tostring(data['bbcodeoff']))
		end
	
		if data['smileyoff'] and self.smileyoff and self.smileyoff:is_init() then
			self.smileyoff:set_inner_text(tostring(data['smileyoff']))
		end
	
		if data['parseurloff'] and self.parseurloff and self.parseurloff:is_init() then
			self.parseurloff:set_inner_text(tostring(data['parseurloff']))
		end
	
		if data['attachment'] and self.attachment and self.attachment:is_init() then
			self.attachment:set_inner_text(tostring(data['attachment']))
		end
	
		if data['ratetimes'] and self.ratetimes and self.ratetimes:is_init() then
			self.ratetimes:set_inner_text(tostring(data['ratetimes']))
		end
	
		if data['status'] and self.status and self.status:is_init() then
			self.status:set_inner_text(tostring(data['status']))
		end
	
		if data['tags'] and self.tags and self.tags:is_init() then
			self.tags:set_inner_text(tostring(data['tags']))
		end
	
		if data['comment'] and self.comment and self.comment:is_init() then
			self.comment:set_inner_text(tostring(data['comment']))
		end
	
		if data['replycredit'] and self.replycredit and self.replycredit:is_init() then
			self.replycredit:set_inner_text(tostring(data['replycredit']))
		end
	
		if data['position'] and self.position and self.position:is_init() then
			self.position:set_inner_text(tostring(data['position']))
		end
	
end


	