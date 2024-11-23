
gr_module("GmCtrl")

LoadingCtrl = inherit(GmCtrl.ControlBase):name("LoadingCtrl")

LoadingCtrl.init = function (self,parent,elename)
	--print('LoadingCtrl.init')
	local top = self	
	GmCtrl.ControlBase.init(self,parent,elename or "loadingbar")
	self.loadingword = self:get_child("loadingword")
	self.loadimage = self:get_child("loadimage")
end

LoadingCtrl.set_word = function(self,txt)
	self.loadingword:set_inner_text(txt)
end

LoadingCtrl.set_loading = function(self,bl)
	--print('LoadingCtrl.set_loading',bl)
	if bl then
		self.loadimage:set_style("margin-top:8px;",true)
		self.parent:set_visible(true,true)
	else
		self.loadimage:set_style("display:none;",true)
		self.parent:set_visible(false,true)
	end
end

LoadingCtrl.showBar = function(self,bl)
	if bl then
		self:set_visible(true,true)
		self.loadimage:set_style("margin-top:8px;")
	else
		self:set_visible(false,true)
		self.loadimage:set_style("display:none;")
	end
end

