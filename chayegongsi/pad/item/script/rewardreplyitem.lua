

-- D:\GOA\reslibrary\templete\res\item\item.pad.lua.xsl
gr_module("gm_chayegongsi")

rewardreplyitemItem = inherit(GmCtrl.ControlBase):name("rewardreplyitemItem")

rewardreplyitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "rewardreplyitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.fid = self:get_child("fid")
	
	self.tid = self:get_child("tid")
	
	self.typeid = self:get_child("typeid")
	
	self.sortid = self:get_child("sortid")
	
	self.avatar = self:get_child("avatar")
	
	self.cover = self:get_child("cover")
	
	self.thumbpath = self:get_child("thumbpath")
	
	self.summary = self:get_child("summary")
	
	self.author = self:get_child("author")
	
	self.authorid = self:get_child("authorid")
	
	self.subject = self:get_child("subject")
	
	self.dateline = self:get_child("dateline")
	
	self.status = self:get_child("status")
	
	self.comments = self:get_child("comments")
	
	self.favtimes = self:get_child("favtimes")
	
	self.sharetimes = self:get_child("sharetimes")
	
	self.replies = self:get_child("replies")
	
	self.views = self:get_child("views")
	
	
	
end


rewardreplyitemItem.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	