
					
-- D:\GOA\reslibrary\templete\default\pc\area\mainmenu\lua.xsl
gr_module("gm_minjieyingshi")

mainmenuArea = inherit(GmCtrl.ControlBase):name("mainmenuArea")

mainmenuArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "mainmenuArea"
	GmCtrl.ControlBase.init(self,parent,fid )
	
	self:show_scroll_bar(true)
	

	self.task = self:get_child("bt_task")
	self.task:set_click(function(link)
		 top.hostWindow:showFrame('task',nil,function(frame) end)
	end)
	
	
	self.logger = self:get_child("bt_logger")
	self.logger:set_click(function(link)
		 top.hostWindow:showFrame('logger',nil,function(frame) end)
	end)
	
	
	self.model = self:get_child("bt_model")
	self.model:set_click(function(link)
	
	end)
	
	
	self.model_model = self:get_child("bt_model_model")
	self.model_model:set_click(function(link)
		 top.hostWindow:showFrame('model',nil,function(frame) end)
	end)
	
	
	self.model_inputmodel = self:get_child("bt_model_inputmodel")
	self.model_inputmodel:set_click(function(link)
		 top.hostWindow:showFrame('inputmodel',nil,function(frame) end)
	end)
	
	
	self.model_outputmodel = self:get_child("bt_model_outputmodel")
	self.model_outputmodel:set_click(function(link)
		 top.hostWindow:showFrame('outputmodel',nil,function(frame) end)
	end)
	
	
	
	self.storage = self:get_child("bt_storage")
	self.storage:set_click(function(link)
		 top.hostWindow:showFrame('storagemanager',nil,function(frame) end)
	end)
	
	
	self.dataset = self:get_child("bt_dataset")
	self.dataset:set_click(function(link)
		 top.hostWindow:showFrame('dataset',nil,function(frame) end)
	end)
	
	
	self.automation = self:get_child("bt_automation")
	self.automation:set_click(function(link)
	
	end)
	
	
	self.automation_controller_pipelinecontroller = self:get_child("bt_automation_controller_pipelinecontroller")
	self.automation_controller_pipelinecontroller:set_click(function(link)
		 top.hostWindow:showFrame('automation_controller_pipelinedecorator',nil,function(frame) end)
	end)
	
	
	self.automation_job_clearmljob = self:get_child("bt_automation_job_clearmljob")
	self.automation_job_clearmljob:set_click(function(link)
		 top.hostWindow:showFrame('automation_clearmljob',nil,function(frame) end)
	end)
	
	
	self.scheduler = self:get_child("bt_scheduler")
	self.scheduler:set_click(function(link)
		 top.hostWindow:showFrame('automation_taskscheduler',nil,function(frame) end)
	end)
	
	
	self.trigger = self:get_child("bt_trigger")
	self.trigger:set_click(function(link)
		 top.hostWindow:showFrame('automation_triggerscheduler',nil,function(frame) end)
	end)
	
	
	self.hpo_optimization = self:get_child("bt_hpo_optimization")
	self.hpo_optimization:set_click(function(link)
	
	end)
	
	
	self.hpo_optimization_hyperparameteroptimizer = self:get_child("bt_hpo_optimization_hyperparameteroptimizer")
	self.hpo_optimization_hyperparameteroptimizer:set_click(function(link)
		 top.hostWindow:showFrame('automation_hyperparameteroptimizer',nil,function(frame) end)
	end)
	
	
	self.hpo_optimization_gridsearch = self:get_child("bt_hpo_optimization_gridsearch")
	self.hpo_optimization_gridsearch:set_click(function(link)
		 top.hostWindow:showFrame('automation_gridsearch',nil,function(frame) end)
	end)
	
	
	self.hpo_optimization_randomsearch = self:get_child("bt_hpo_optimization_randomsearch")
	self.hpo_optimization_randomsearch:set_click(function(link)
		 top.hostWindow:showFrame('automation_randomsearch',nil,function(frame) end)
	end)
	
	
	self.hpo_optuna_optuna_optimizeroptuna = self:get_child("bt_hpo_optuna_optuna_optimizeroptuna")
	self.hpo_optuna_optuna_optimizeroptuna:set_click(function(link)
		 top.hostWindow:showFrame('automation_optuna_optimizeroptuna',nil,function(frame) end)
	end)
	
	
	self.hpo_hpbandster_bandster_optimizerbohb = self:get_child("bt_hpo_hpbandster_bandster_optimizerbohb")
	self.hpo_hpbandster_bandster_optimizerbohb:set_click(function(link)
		 top.hostWindow:showFrame('automation_hpbandster_optimizerbohb',nil,function(frame) end)
	end)
	
	
	self.hpo_parameters_discreteparameterrange = self:get_child("bt_hpo_parameters_discreteparameterrange")
	self.hpo_parameters_discreteparameterrange:set_click(function(link)
		 top.hostWindow:showFrame('automation_discreteparameterrange',nil,function(frame) end)
	end)
	
	
	self.hpo_parameters_uniformintegerparameterrange = self:get_child("bt_hpo_parameters_uniformintegerparameterrange")
	self.hpo_parameters_uniformintegerparameterrange:set_click(function(link)
		 top.hostWindow:showFrame('automation_uniformintegerparameterrange',nil,function(frame) end)
	end)
	
	
	self.hpo_parameters_uniformparameterrange = self:get_child("bt_hpo_parameters_uniformparameterrange")
	self.hpo_parameters_uniformparameterrange:set_click(function(link)
		 top.hostWindow:showFrame('automation_uniformparameterrange',nil,function(frame) end)
	end)
	
	
	self.hpo_parameters_parameterset = self:get_child("bt_hpo_parameters_parameterset")
	self.hpo_parameters_parameterset:set_click(function(link)
		 top.hostWindow:showFrame('automation_parameterset',nil,function(frame) end)
	end)
	
	
	
end

