
	
gr_module("gm_minjieyingshi")

ursInfoCountFormArea = inherit(GmCtrl.ControlBase):name("ursInfoCountFormArea")

ursInfoCountFormArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "ursInfoCountFormArea"
	GmCtrl.ControlBase.init(self,parent,fid )
		
	self.follower = self:get_child('follower')
	
	self.following = self:get_child('following')
	
	self.posts = self:get_child('posts')
	
end

ursInfoCountFormArea.set_data = function(self,data)
	print('ursInfoCountFormArea.set_data',data)
	if data.follower and type(data.follower) == 'string' then
		self.follower:set_inner_text(data.follower)
	end
	if data.following and type(data.following) == 'string' then
		self.following:set_inner_text(data.following)
	end
	if data.posts and type(data.posts) == 'string' then
		self.posts:set_inner_text(data.posts)
	end
end
	
	