
					
					
gr_module("gm_minjieyingshi")

iconlistArea = inherit(GmBase.iconlistArea):name("iconlistArea")

iconlistArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "iconlistArea"
	GmBase.iconlistArea.init(self,parent,fid )

	self.func = function(ctrl)
		ctrl.data['class'] = ctrl.data['id']
		self.hostWindow:exec_action(self ,'activitylist', ctrl.data)
	end
	
end


iconlistArea.set_column = function(self,col)
	self.column = col
	self.column_width = 150
end
	
iconlistArea.on_select = function(self,data)
	self.hostWindow:exec_action(self ,'switch', data)
end

	