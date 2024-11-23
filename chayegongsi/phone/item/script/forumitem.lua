

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
	for a,b in pairs(data) do
		if data[a] and self[a] and self[a].set_inner_text and self[a].is_init and self[a]:is_init() then
			self[a]:set_inner_text(tostring(data[a]))
		end
	end
end


	