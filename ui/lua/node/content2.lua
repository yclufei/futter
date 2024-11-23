		
gr_module("GmUINode")

content2_node = inherit(GmBase.Node):name("content2_node")

content2_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"content2")	
												

	
	self.panel_object_mgr = GmUI.panel_object_mgr_ctrl(self)
	if not self.panel_object_mgr:is_init() then
		cerror('GmUINode.content1_node init error : panel_object_mgr')
	end
	self.panel_object_mgr.sztitle = '对象管理'



	self.panel_object_list = GmUI.panel_object_list_ctrl(self)
	if not self.panel_object_list:is_init() then
		cerror('GmUINode.content1_node init error : panel_object_list')
	end
	self.panel_object_list.canvas = self.panel_object_list:make_plugin('flash','flashplayer')
	--self.panel_object_list.canvas:set_src('a.svg')
	self.panel_object_list.sztitle = '对象列表'



	self.panel_template_mgr = GmUI.panel_template_mgr_ctrl(self)
	if not self.panel_template_mgr:is_init() then
		cerror('GmUINode.content1_node init error : panel_template_mgr')
	end
	self.panel_template_mgr.sztitle = '模板管理'



	self.panel_template_list = GmUI.panel_template_list_ctrl(self)
	if not self.panel_template_list:is_init() then
		cerror('GmUINode.content1_node init error : panel_template_list')
	end
	self.panel_template_list.sztitle = '模板列表'
	
				
	self.dock1 = self:get_child('dock1')

	self.dock2 = self:get_child('dock2')

	self.dock3 = self:get_child('dock3')

	self.dock4 = self:get_child('dock4')

	self.dock1.DockPanel  = GmUI.DockPanel(self.dock1,nil,'模板列表1')

	self.dock2.DockPanel  = GmUI.DockPanel(self.dock2,nil,'对象列表2')

	self.dock3.DockPanel  = GmUI.DockPanel(self.dock3,nil,'模板列表3')

	self.dock4.DockPanel  = GmUI.DockPanel(self.dock4,nil,'对象列表4')

end