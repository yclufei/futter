-- ÇĞ»»Ãæ°åÀà
gr_module("GmCtrl")

TabBase = inherit():name("TabBase")


TabBase.init = function(self,parent,tabid,contentid)
	
	local top = self
	
	self.parent = parent
	
	self.currentTab = nil
	self.tabs = {}
	self.tabparent = parent:get_child(tabid)
	for i = 1,self.tabparent:get_child_tbl_count("td") do
		self.tabs[i] = self.tabparent:get_child_tbl_by_sort("td",i)
		self.tabs[i]:set_click(function(ctrl) top:SelectTab(i) end)
		--self.tabs[i]:print_outer_html()
	end	
	
	self.contentparent = parent:get_child(contentid)
	self.contents = {}
	for i = 1,self.contentparent:get_child_tbl_count("div") do
		self.contents[i] = self.contentparent:get_child_tbl_by_sort("div",i)
		self.contents[i].idx = i
	end
	
	self.currentTab = self.contents[1]
end

TabBase.getContents = function(self)
	return self.contents
end

TabBase.SelectTab = function(self,tabid)
	if self.currentTab ~= self.contents[tabid] then
		self.currentTab:set_visible(false)
		self.currentTab = self.contents[tabid]
		self.currentTab:set_visible(true)
		return true
	end
end
