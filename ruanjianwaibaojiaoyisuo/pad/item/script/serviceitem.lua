

-- D:\GOA\reslibrary\templete\res\item\item.pad.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

serviceitemItem = inherit(GmCtrl.ControlBase):name("serviceitemItem")

serviceitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "serviceitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.fid = self:get_child("fid")
	
	self.tid = self:get_child("tid")
	
	self.avatar = self:get_child("avatar")
	
	self.pic = self:get_child("pic")
	
	self.thumbpath = self:get_child("thumbpath")
	
	self.summary = self:get_child("summary")
	
	self.author = self:get_child("author")
	
	self.authorid = self:get_child("authorid")
	
	self.subject = self:get_child("subject")
	
	self.dateline = self:get_child("dateline")
	
	self.message = self:get_child("message")
	
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


	