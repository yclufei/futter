	
-- area.pad.lua.xsl
					
gr_module("gm_chayegongsi")

foruminfoareaArea = inherit(GmCtrl.ControlBase):name("foruminfoareaArea")

foruminfoareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "foruminfoareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)

	
		self.forumdetail = gm_chayegongsi.forumitemItem(self.scrollcontainer)
		-- form.lua.xsl form 91
		
	self.useip = self:get_child("useip")
	
	self.port = self:get_child("port")
	
	self.usesig = self:get_child("usesig")
	
	self.htmlon = self:get_child("htmlon")
	
	self.bbcodeoff = self:get_child("bbcodeoff")
	
	self.smileyoff = self:get_child("smileyoff")
	
	self.parseurloff = self:get_child("parseurloff")
	
	self.rate = self:get_child("rate")
	
	self.ratetimes = self:get_child("ratetimes")
	
	self.status = self:get_child("status")
	
	self.replycredit = self:get_child("replycredit")
	
	self.allownoticeauthor = self:get_child("allownoticeauthor")
	
	self.wysiwyg = self:get_child("wysiwyg")
	
	------------ D:\GOA\reslibrary\templete\res\area\_include.lua.xsl 16
			
	self.commentlistarea = gm_chayegongsi.commentlistareaArea(self)
	
	
	
	--0	
		
	

end


foruminfoareaArea.set_data = function(self,data)
	self.data = data
	
			

	-- forumdetail form	
	
	if data['fid'] then
		self.fid:set_inner_text(tostring(data['fid']))
	end	
	
	if data['selectsortid'] then
		self.selectsortid:set_inner_text(tostring(data['selectsortid']))
	end	
	
	if data['pid'] then
		self.pid:set_inner_text(tostring(data['pid']))
	end	
	
	if data['tid'] then
		self.tid:set_inner_text(tostring(data['tid']))
	end	
	
	if data['avatar'] then
		self.avatar:set_inner_text(tostring(data['avatar']))
	end	
	
	if data['pic'] then
		self.pic:set_inner_text(tostring(data['pic']))
	end	
	
	if data['thumbpath'] then
		self.thumbpath:set_inner_text(tostring(data['thumbpath']))
	end	
	
	if data['summary'] then
		self.summary:set_inner_text(tostring(data['summary']))
	end	
	
	if data['first'] then
		self.first:set_inner_text(tostring(data['first']))
	end	
	
	if data['author'] then
		self.author:set_inner_text(tostring(data['author']))
	end	
	
	if data['authorid'] then
		self.authorid:set_inner_text(tostring(data['authorid']))
	end	
	
	if data['subject'] then
		self.subject:set_inner_text(tostring(data['subject']))
	end	
	
	if data['dateline'] then
		self.dateline:set_inner_text(tostring(data['dateline']))
	end	
	
	if data['message'] then
		self.message:set_inner_text(tostring(data['message']))
	end	
	
	if data['useip'] then
		self.useip:set_inner_text(tostring(data['useip']))
	end	
	
	if data['port'] then
		self.port:set_inner_text(tostring(data['port']))
	end	
	
	if data['invisible'] then
		self.invisible:set_inner_text(tostring(data['invisible']))
	end	
	
	if data['anonymous'] then
		self.anonymous:set_inner_text(tostring(data['anonymous']))
	end	
	
	if data['usesig'] then
		self.usesig:set_inner_text(tostring(data['usesig']))
	end	
	
	if data['htmlon'] then
		self.htmlon:set_inner_text(tostring(data['htmlon']))
	end	
	
	if data['bbcodeoff'] then
		self.bbcodeoff:set_inner_text(tostring(data['bbcodeoff']))
	end	
	
	if data['smileyoff'] then
		self.smileyoff:set_inner_text(tostring(data['smileyoff']))
	end	
	
	if data['parseurloff'] then
		self.parseurloff:set_inner_text(tostring(data['parseurloff']))
	end	
	
	if data['attachment'] then
		self.attachment:set_inner_text(tostring(data['attachment']))
	end	
	
	if data['rate'] then
		self.rate:set_inner_text(tostring(data['rate']))
	end	
	
	if data['ratetimes'] then
		self.ratetimes:set_inner_text(tostring(data['ratetimes']))
	end	
	
	if data['status'] then
		self.status:set_inner_text(tostring(data['status']))
	end	
	
	if data['tags'] then
		self.tags:set_inner_text(tostring(data['tags']))
	end	
	
	if data['comment'] then
		self.comment:set_inner_text(tostring(data['comment']))
	end	
	
	if data['replycredit'] then
		self.replycredit:set_inner_text(tostring(data['replycredit']))
	end	
	
	if data['position'] then
		self.position:set_inner_text(tostring(data['position']))
	end	
	
	if data['allownoticeauthor'] then
		self.allownoticeauthor:set_inner_text(tostring(data['allownoticeauthor']))
	end	
	
	if data['wysiwyg'] then
		self.wysiwyg:set_inner_text(tostring(data['wysiwyg']))
	end	
	
	if data['special'] then
		self.special:set_inner_text(tostring(data['special']))
	end	
	
	if data['uid'] then
		self.uid:set_inner_text(tostring(data['uid']))
	end	
	
	if data['rewardprice'] then
		self.rewardprice:set_inner_text(tostring(data['rewardprice']))
	end	
	
	if data['posttime'] then
		self.posttime:set_inner_text(tostring(data['posttime']))
	end	
	
	
end


	

foruminfoareaArea.set_data_id = function(self,data)
	print('foruminfoareaArea.set_data_id',data)
end


	