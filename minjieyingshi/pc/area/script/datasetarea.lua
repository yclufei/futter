
gr_module("gm_minjieyingshi")

datasetareaArea = inherit(GmCtrl.ControlBase):name("datasetareaArea")

datasetareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "datasetareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )
	
	self.scrolllist = self:get_child('scrolllist')

	self.scrolllist:show_scroll_bar(true)

end

