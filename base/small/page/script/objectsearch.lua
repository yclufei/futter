
-- 帖子搜索
gr_module("GmBase")

objectsearchFrame = inherit(GmBase.FrameBase):name("objectsearchFrame")

objectsearchFrame.init = function (self,hostWindow)

	local top = self
	local win = hostWindow
	GmBase.FrameBase.init(self,hostWindow,"templete_objectsearchFrame")

	self.jumpback = self:get_child("jumpback")
	self.jumpback:set_click(function(self)
		top:set_visible(false)
	end)

	self:set_click(function() top:set_visible(false) end)

end

objectsearchFrame.set_clsid = function(self,clsid)
	self.clsid = clsid
--	print(clsid)
end

objectsearchFrame.set_data = function(self,data)
	self.data = data
	--table.print(data)
end
  
