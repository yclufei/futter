

-- D:\GOA\reslibrary\templete\default\phone\item\forumcommentitem\lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

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
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	