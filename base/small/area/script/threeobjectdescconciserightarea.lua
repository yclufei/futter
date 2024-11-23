
gr_module("GmBase")

threeobjectdescconciseRightArea = inherit(GmCtrl.ControlBase):name("threeobjectdescconciseRightArea")

threeobjectdescconciseRightArea.init = function(self,parent,fname)

	local top = self
	
	self.parent = parent
	
	local fid = fname or "threeobjectdescconcise_right_area"
	
	GmCtrl.ControlBase.init(self,parent,fid)
	
	
	self.ctrls['title'] = self:get_child('title')
	self.ctrls['title']:set_click(	function(obj)
																		self:jump_list(self.data,self.data)
		 										 					end)	
	
	self.title = {}
	self.ptitle = {}
	self.pimg = {}
	
	self.func = {}
	
	self.itemcount = 3
	for i = 1,self.itemcount do
		self.title[i] = self:get_child('title'..tostring(i))
		self.ptitle[i] = self:get_child('ptitle'..tostring(i))
		self.pimg[i] = self:get_child('pimg'..tostring(i))
		self.func[i] = 	function(obj)
											local innerdata = obj.data or self.data
											top:on_select(innerdata)
										end
		self.title[i]:set_click(self.func[i])	
		self.ptitle[i]:set_click(self.func[i])	
		self.pimg[i]:set_click(self.func[i])	
	end

end


threeobjectdescconciseRightArea.on_select = function(self,data)
	print('threeobjectdescconciserightareaArea.on_select')
--	table.print(data)
	self.hostWindow:exec_action('forumlist:'..tostring(data.id))
end




threeobjectdescconciseRightArea.callback = function(self,callbackey,tbname,postparam,data,sortkey,ids)
	--print('threeobjectdescconciseRightArea.callback ',self._ID, callbackey,tbname,postparam,data,sortkey,ids)
	if self.net.classname..'.'..self.netmethon == callbackey then		
		local attrs = self:GetAttrs()
		for k,v in pairs(attrs) do
			if postparam[k] ~= v then
				--print('ControlBase.callback quit',k, postparam[k] , v)
				return
			end
		end
		local page = 0
		if data['pageinfo'] then
			page = data['pageinfo'].page - 1
		end
		--local dbsql = self:GetDBWhereChildSql()
		--print('threeobjectdescconciseLeftArea.callback ',dbsql)
		local where = ' where '..sortkey..' in ('..ids..') '
		self:init_item_data(self.tablename ,where, ' ',page,self.movecount)
		return true
	end
	return false
end

threeobjectdescconciseRightArea.set_data = function(self,data)
	self.data = data
	if data and table.size(data) > 2 then
		local osort = 1
		for a,b in pairs(data) do
			if b['imgsrc'] then
				self.pimg[osort]:set_src(b['imgsrc'])
			end
			if b['title'] then
				self.title[osort]:set_inner_text(b['title'])
			end
			if b['ptitle'] then
				self.ptitle[osort]:set_inner_text(b['ptitle'])
			end
			self.title[osort].data = b
			self.ptitle[osort].data = b
			self.pimg[osort].data = b
			osort= osort + 1
			if osort == 4 then
				break
			end
		end
	end
end
