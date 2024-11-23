
gr_module("GmBase")

objectdesclistArea = inherit(GmCtrl.ListBase):name("objectdesclistArea")

objectdesclistArea.init = function(self,parent)
	print('objectdesclistArea.init',parent._ID)
	local top = self
	self.parent = parent	
	local urls = {}	
	
	urls["get"] = g_serverAddress.."objectdesc/get_objects_by_tree_rel/page/%d/pagecount/%d/treeid/%d/withrel/true/withattr/true"
	urls["del"] = g_serverAddress.."tree/delete/id/%d"
	
	GmCtrl.ListBase.init(self,parent,"objectdesclistarea",urls)
	
	self.scrollTable = self:get_child("scrollTable")
	
	
	self.topload = self:get_child("topload")	
	
	self.toploading = GmCtrl.LoadingCtrl(self.topload)
	self.toploading:set_word("正在刷新")
	
	self.topshowword = self:get_child("topshowword")
	
	self.nocontent = self:get_child('nocontent')
	
	self.listbottominfo =  self:get_child('listbottominfo')
	self.bottomloadgif =  self:get_child('bottomloadgif')
	
	self:init_scroll_content_size()

end


objectdesclistArea.init_loading = function(self)
end


objectdesclistArea.init_child_height = function(self)
	local w,h,x,y = self.childs.scrollcontainer:get_scroll_pos()
	if h ~= nil and h > 0 then
		local height = d + 110 * gInfo['retina'] * 2
		
		local style = 'height:'..tostring(h)..'px'
		print('!!!!!!!!!!!!!!!!!!!!!! objectdesclistArea.init_child_height #1 ',self.parent._ID,style)
		self.listheight:set_style(style)
		print("objectdesclistArea.init_child_height",height)
	end
end


objectdesclistArea.on_scroll_top = function(self)
	if self.loading == false then
			self:clear()
			self:init_top_pos()
			self.toploading:set_word("正在刷新")
			self.toploading:set_loading(true)
			--self.bottomloading:set_word("正在刷新")
			self.listbottominfo:set_inner_text("加载更多")
			self.hostWindow:updatetick()
			return true
	else
		print("objectdesclistArea.on_scroll_top note",self.loading)
	end
	return false
end


objectdesclistArea.on_scroll_bottom = function(self)
	if self.loading == false then
		if self.curTotalPage > 0 then
			if self.curPage < self.curTotalPage - 1 then
				self.hostWindow:cancel_auto_scroll()

				self.listbottominfo:set_inner_text("加载更多")
				self.listbottominfo:set_style("display:none;")
				self.bottomloadgif:set_style("display:inline-block;")
				
				self.hostWindow:updatetick()
				return true
			else
				self.hostWindow:cancel_auto_scroll()
				
				self.listbottominfo:set_style("display:block;")
				self.listbottominfo:set_inner_text("最后一页")
				
				self.hostWindow:updatetick()
			end
		else
			self.hostWindow:cancel_auto_scroll()
			
			--self.bottomloading:set_loading(true)
			
			
			self.listbottominfo:set_style("display:none;")
			self.bottomloadgif:set_style("display:inline-block;")
			
			self.hostWindow:layout()
			self.hostWindow:updatetick()
			return true
		end
	end
	self.hostWindow:updatetick()
	return false
end


objectdesclistArea.set_data = function(self,id,postparam)
	if id and id ~= self.id or postparam ~= nil  then
		self.toploading:set_loading(true)
		self.id = id
		local url = string.format( self.urls["get"] ,self.curPage,self.curPageCount,id)
		self:curl(url,function(a) self:datacallback(a) end,postparam)
	end
end


objectdesclistArea.trans_data = function(self,data)
	data['sitemtype'] = CONST_TREE_TYPE[ data['itemtype'] ]
	data['sitemsubtype'] = CONST_TREE_SUBTYPE[ data['itemsubtype'] ]
	if data['clsid'] then
		self.clsid = data['clsid']
	end	
	return data
end


objectdesclistArea.ondatacallback = function(self,data)	
	self.toploading:set_loading(false)
	if self.topshowword and self.topshowword:is_init() then
		self.topshowword:set_style("display:inline;")
	end
	self.bottomloadgif:set_style("display:none;")
	self.listbottominfo:set_style("display:block;")
end


objectdesclistArea.init_item = function(self,item)
	local top = self								
end


