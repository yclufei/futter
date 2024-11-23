

-- D:\GOA\reslibrary\templete\default\pad\item\rewarditem\lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

rewarditemItem = inherit(GmCtrl.ControlBase):name("rewarditemItem")

rewarditemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "rewarditemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	
  
	self.typeid = self:get_child("typeid")
	
  
	self.sortid = self:get_child("sortid")
	
  
	self.cover = self:get_child("cover")	
	self.cover.set_inner_text = function(ctrl,src)
		ctrl:set_src('http://xiguadushu.com/h5/'..src)
	end
	
  
	self.thumbpath = self:get_child("thumbpath")
	
  
	self.summary = self:get_child("summary")
	
  
	self.author = self:get_child("author")
	
  
	self.subject = self:get_child("subject")
	self.subject:set_click(function(ctrl)
		local toptop = top
		top.hostWindow:addNavFrame("rewardinfo",nil,function(frame) frame:set_data(toptop.data) end)
	end)
	
  
	self.comments = self:get_child("comments")
	
  
	self.favtimes = self:get_child("favtimes")
	
  
	self.sharetimes = self:get_child("sharetimes")
	
  
	self.replies = self:get_child("replies")
	
  
	self.views = self:get_child("views")
	
  
	self.fid = self:get_child("fid")
	
  
	self.tid = self:get_child("tid")
	
  
	self.avatar = self:get_child("avatar")
	
  
	self.authorid = self:get_child("authorid")
	
  
	self.dateline = self:get_child("dateline")	
	self.dateline.set_inner_text = function(ctrl,src)
			local now = os.date("%Y-%m-%d %H:%M:%S", tonumber(src))
			GmBase.Node.set_inner_text(ctrl,now)
	end
	
  
	self.status = self:get_child("status")
	

	
end


rewarditemItem.set_data = function(self,data)
	self.data = data
	
	if data['typeid'] and self.typeid and self.typeid.set_inner_text and self.typeid.is_init and self.typeid:is_init() then
		self.typeid:set_inner_text(tostring(data['typeid']))
	end
	
	if data['sortid'] and self.sortid and self.sortid.set_inner_text and self.sortid.is_init and self.sortid:is_init() then
		self.sortid:set_inner_text(tostring(data['sortid']))
	end
	
	if data['cover'] and self.cover and self.cover.set_inner_text and self.cover.is_init and self.cover:is_init() then
		self.cover:set_inner_text(tostring(data['cover']))
	end
	
	if data['thumbpath'] and self.thumbpath and self.thumbpath.set_inner_text and self.thumbpath.is_init and self.thumbpath:is_init() then
		self.thumbpath:set_inner_text(tostring(data['thumbpath']))
	end
	
	if data['summary'] and self.summary and self.summary.set_inner_text and self.summary.is_init and self.summary:is_init() then
		self.summary:set_inner_text(tostring(data['summary']))
	end
	
	if data['author'] and self.author and self.author.set_inner_text and self.author.is_init and self.author:is_init() then
		self.author:set_inner_text(tostring(data['author']))
	end
	
	if data['subject'] and self.subject and self.subject.set_inner_text and self.subject.is_init and self.subject:is_init() then
		self.subject:set_inner_text(tostring(data['subject']))
	end
	
	if data['comments'] and self.comments and self.comments.set_inner_text and self.comments.is_init and self.comments:is_init() then
		self.comments:set_inner_text(tostring(data['comments']))
	end
	
	if data['favtimes'] and self.favtimes and self.favtimes.set_inner_text and self.favtimes.is_init and self.favtimes:is_init() then
		self.favtimes:set_inner_text(tostring(data['favtimes']))
	end
	
	if data['sharetimes'] and self.sharetimes and self.sharetimes.set_inner_text and self.sharetimes.is_init and self.sharetimes:is_init() then
		self.sharetimes:set_inner_text(tostring(data['sharetimes']))
	end
	
	if data['replies'] and self.replies and self.replies.set_inner_text and self.replies.is_init and self.replies:is_init() then
		self.replies:set_inner_text(tostring(data['replies']))
	end
	
	if data['views'] and self.views and self.views.set_inner_text and self.views.is_init and self.views:is_init() then
		self.views:set_inner_text(tostring(data['views']))
	end
	
	if data['fid'] and self.fid and self.fid.set_inner_text and self.fid.is_init and self.fid:is_init() then
		self.fid:set_inner_text(tostring(data['fid']))
	end
	
	if data['tid'] and self.tid and self.tid.set_inner_text and self.tid.is_init and self.tid:is_init() then
		self.tid:set_inner_text(tostring(data['tid']))
	end
	
	if data['avatar'] and self.avatar and self.avatar.set_inner_text and self.avatar.is_init and self.avatar:is_init() then
		self.avatar:set_inner_text(tostring(data['avatar']))
	end
	
	if data['authorid'] and self.authorid and self.authorid.set_inner_text and self.authorid.is_init and self.authorid:is_init() then
		self.authorid:set_inner_text(tostring(data['authorid']))
	end
	
	if data['dateline'] and self.dateline and self.dateline.set_inner_text and self.dateline.is_init and self.dateline:is_init() then
		self.dateline:set_inner_text(tostring(data['dateline']))
	end
	
	if data['status'] and self.status and self.status.set_inner_text and self.status.is_init and self.status:is_init() then
		self.status:set_inner_text(tostring(data['status']))
	end
	
end


	