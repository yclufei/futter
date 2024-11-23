
gr_module("GmBase")

textursconciseArea = inherit(GmCtrl.ControlBase):name("textursconciseArea")

textursconciseArea.init = function(self,parent)

	local top = self

	GmCtrl.ControlBase.init(self,parent,"textursconcisearea")
	
	self.content = self:get_child("content")

	self.content:set_click(function(self)
--		print("attrupdateFrame",top)
		local frame = top.parent.hostWindow:make_frame("aaff","attrupdateFrame",false)
--		print(frame)
		top.parent.hostWindow:addNavFrame("aaff")
	end)
	
	
end