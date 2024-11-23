

-- D:\GOA\reslibrary\templete\res\item\item.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

forumforumitemItem = inherit(GmCtrl.ControlBase):name("forumforumitemItem")

forumforumitemItem.init = function (self,parent,aid)

	local top = self
	local win = parent.hostWindow
	local fid = aid or "forumforumitemItem"
	GmCtrl.ControlBase.init(self,parent,fid,true)

	
	self.allowanonymous = self:get_child("allowanonymous")
	
	self.allowappend = self:get_child("allowappend")
	
	self.allowbbcode = self:get_child("allowbbcode")
	
	self.alloweditpost = self:get_child("alloweditpost")
	
	self.alloweditrules = self:get_child("alloweditrules")
	
	self.allowfeed = self:get_child("allowfeed")
	
	self.allowglobalstick = self:get_child("allowglobalstick")
	
	self.allowhtml = self:get_child("allowhtml")
	
	self.allowimgcode = self:get_child("allowimgcode")
	
	self.allowmediacode = self:get_child("allowmediacode")
	
	self.allowpostspecial = self:get_child("allowpostspecial")
	
	self.allowside = self:get_child("allowside")
	
	self.allowsmilies = self:get_child("allowsmilies")
	
	self.allowspecialonly = self:get_child("allowspecialonly")
	
	self.archive = self:get_child("archive")
	
	self.autoclose = self:get_child("autoclose")
	
	self.catforumcolumns = self:get_child("catforumcolumns")
	
	self.commoncredits = self:get_child("commoncredits")
	
	self.disablecollect = self:get_child("disablecollect")
	
	self.disablethumb = self:get_child("disablethumb")
	
	self.disablewatermark = self:get_child("disablewatermark")
	
	self.displayorder = self:get_child("displayorder")
	
	self.domain = self:get_child("domain")
	
	self.favtimes = self:get_child("favtimes")
	
	self.fid = self:get_child("fid")
	
	self.forumcolumns = self:get_child("forumcolumns")
	
	self.fup = self:get_child("fup")
	
	self.inheritedmod = self:get_child("inheritedmod")
	
	self.jammer = self:get_child("jammer")
	
	self.lastpost = self:get_child("lastpost")
	
	self.level = self:get_child("level")
	
	self.modnewposts = self:get_child("modnewposts")
	
	self.modworks = self:get_child("modworks")
	
	self.name = self:get_child("name")
	
	self.oldrank = self:get_child("oldrank")
	
	self.posts = self:get_child("posts")
	
	self.rank = self:get_child("rank")
	
	self.recommend = self:get_child("recommend")
	
	self.recyclebin = self:get_child("recyclebin")
	
	self.sharetimes = self:get_child("sharetimes")
	
	self.simple = self:get_child("simple")
	
	self.status = self:get_child("status")
	
	self.styleid = self:get_child("styleid")
	
	self.threadcaches = self:get_child("threadcaches")
	
	self.threads = self:get_child("threads")
	
	self.todayposts = self:get_child("todayposts")
	
	self.type = self:get_child("type")
	
	self.yesterdayposts = self:get_child("yesterdayposts")
	
	
	
end


forumforumitemItem.set_data = function(self,data)
	self.data = data
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	