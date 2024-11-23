
		


gr_module("gm_minjieyingshi")

ClientWindow = inherit(GmBase.BigWindow):name("ClientWindow")


ClientWindow.init = function (self,w,h)

	local top = self
	local win = self
	
	GmBase.BigWindow.init(self,"minjieyingshi/pc/main/html/main.html")
	
	self.sb = self.body:get_child('sysbutton')
	self.sb:set_drag_window(true)
	self.sb:set_dblclick(function(ctrl)
		top.hostWindow:maxbox()
	end)
	
	self.mainmenu = gm_minjieyingshi.mainmenuArea(self.body)
	self.mainmenu:set_dblclick(function(ctrl)
		top.hostWindow:maxbox()
	end)

	self.sysbutton  = GmBase.SysButton(self.hostWindow,true,true,true)
	
	self.actionmask:set_visible(false)

	self.msgbox = gm_minjieyingshi.MessageBox(self)
	
	
	--self:createFrame('first','firstFrame')
	
	self:createFrame('task','taskFrame')
	
	self:createFrame('logger','loggerFrame')
	self:createFrame('model','modelFrame')
	self:createFrame('inputmodel','inputmodelFrame')
	self:createFrame('outputmodel','outputmodelFrame')
	self:createFrame('storagemanager','storagemanagerFrame')
	self:createFrame('dataset','datasetFrame')
	self:createFrame('pipelinecontroller ','pipelinecontroller Frame')
	self:createFrame('automation_controller_pipelinedecorator','automation_controller_pipelinedecoratorFrame')
	self:createFrame('automation_clearmljob','automation_clearmljobFrame')
	self:createFrame('automation_taskscheduler','automation_taskschedulerFrame')
	self:createFrame('automation_triggerscheduler','automation_triggerschedulerFrame')
	self:createFrame('automation_hyperparameteroptimizer','automation_hyperparameteroptimizerFrame')
	self:createFrame('automation_gridsearch','automation_gridsearchFrame')
	self:createFrame('automation_randomsearch','automation_randomsearchFrame')
	self:createFrame('automation_optuna_optimizeroptuna','automation_optuna_optimizeroptunaFrame')
	self:createFrame('automation_hpbandster_optimizerbohb','automation_hpbandster_optimizerbohbFrame')
	self:createFrame('automation_discreteparameterrange','automation_discreteparameterrangeFrame')
	self:createFrame('automation_uniformintegerparameterrange','automation_uniformintegerparameterrangeFrame')
	self:createFrame('automation_uniformparameterrange','automation_uniformparameterrangeFrame')
	self:createFrame('automation_parameterset','automation_parametersetFrame')
	
			
	self:createFrame('createmusic','createmusicFrame')
				
	
	
	self:updatetick()
	
	
			
	self:showFrame('dataset')
				
		
		
	self:set_size(w,h)
	
	
	self:layout()
	
	self:set_visible(true)
	
	
	

	self:updatetick()

end   



ClientWindow.createFrame = function(self,key,cls)
	local top = self
	local status, msg = xpcall(function ()
	        top.frame[key] = gm_minjieyingshi[cls](top.mScrollViewParent)
	    end, __G__TRACKBACK__)
end



ClientWindow.init_data = function(self)
	local top = self

	if gInfo['location']  and gInfo['location']['x'] > 0 and gInfo['location']['y'] > 0 then
		self:on_location(gInfo['location']['x'] , gInfo['location']['y'])
	else
		self:start_location()	
		self.mScrollViewParent:set_timeout(2)
	end

	self.curframe.advmulBigArea:start()
	
end


ClientWindow.showMsg = function(self,msgtext)
	self.msgbox:set_data(msgtext)
end



ClientWindow.on_command = function(self,data)
	local top = self
	if self:has_frame(data.name) then
		local frame = self:addNavFrame(data.name)
	elseif data.name == 'quit' then
	
	end
end





ClientWindow.on_location = function(self,x,y)
	
	
	local top = self
	
	self.location = {}
	self.location['x'] = x
	self.location['y'] = y
		
		
		self.addrcallback = function(data)
		
			if data["success"] then
				top.location = data['main']
				local frame =	top:get_frame("GOFrame")
				if frame then
					frame:init_list(data['near'])
				else
					print("no goframe")
				end
			end
		end
		
	
end


	