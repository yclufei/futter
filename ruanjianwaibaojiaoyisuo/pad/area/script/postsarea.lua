	
-- area.pad.lua.xsl
					
gr_module("gm_ruanjianwaibaojiaoyisuo")

postsareaArea = inherit(GmCtrl.ControlBase):name("postsareaArea")

postsareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "postsareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )


	self.scrollcontainer = self:get_child("slistscrolllist")
	self.scrollcontainer:set_scroll_container(true)

	
	
	
	self.readperm = self:get_child('readperm')
	self.rushreplyfrom = self:get_child('rushreplyfrom')
	self.rushreplyto = self:get_child('rushreplyto')
	self.rewardfloor = self:get_child('rewardfloor')
	self.replylimit = self:get_child('replylimit')
	self.stopfloor = self:get_child('stopfloor')
	self.creditlimit = self:get_child('creditlimit')
	self.cronpublishdate = self:get_child('cronpublishdate')
	self.allownoticeauthor = self:get_child('allownoticeauthor')
	self.usesig = self:get_child('usesig')
	self.save = self:get_child('save')
	self.adddynamic = self:get_child('adddynamic')
	self.wysiwyg = self:get_child('wysiwyg')
	self.mod = self:get_child('mod')
	self.action = self:get_child('action')
	self.special = self:get_child('special')
	self.addfeed = self:get_child('addfeed')
	self.uploadalbum = self:get_child('uploadalbum')
	self.remoteimgurl = self:get_child('remoteimgurl')
	self.localimgurl = self:get_child('localimgurl')
	self.price = self:get_child('price')
	self.tags = self:get_child('tags')
	--self.attachnew = self:get_child('attachnew')

	self.uid = self:get_child('uid')
	self.fid = self:get_child('fid')
	self.subject = self:get_child('subject')
	self.message = self:get_child('message')
	self.rewardprice = self:get_child('rewardprice')
	self.selectsortid = self:get_child('selectsortid')
	self.sortid = self:get_child('sortid')
	
	
	
	self.mgr = gm_ruanjianwaibaojiaoyisuo.clsforummgr.get_instance()
	self.mgr:add_ui('loginareaArea',self)


	self.public = self:get_child("public")
	self.public:set_click(function(link)			
		local modal = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
		if modal:has_session() then
			top.mgr:run('forumpost',top)
		else
			top.hostWindow:addNavFrame('login')
		end
	end)
		
		
	

end

