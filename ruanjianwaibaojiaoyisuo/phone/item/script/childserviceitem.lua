

-- D:\GOA\reslibrary\templete\res\item\item.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

childServiceitemItem = inherit(GmCtrl.ControlBase):name("childServiceitemItem")

childServiceitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "childServiceitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.fid = self:get_child("fid")
	
	self.tid = self:get_child("tid")
	
	self.typeid = self:get_child("typeid")
	
	self.sortid = self:get_child("sortid")
	
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
	
	self.thumb = self:get_child("thumb")
	
	self.thumb.set_inner_text = function(ctrl,uri)
		ctrl:set_src(uri)
	end
	
	self.message = self:get_child("message")
	
	
	
end


childServiceitemItem.callback = function(self,key,tb,param,netdata,sortid,ids)
--	print('childServiceitemItem.callback',key,tb,param)
--	table.print(param)
--	table.print(netdata)
end



childServiceitemItem.set_data = function(self,data)
	self.data = data
	
	
	self:set_childs_inner_text(self.data)
	
	
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
	self.dateline:set_inner_html(self.data.dateline)
	
end


	