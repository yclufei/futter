


gr_module("GmBase")

categarylistSmallArea = inherit(GmCtrl.ControlBase):name("categarylistSmallArea")

categarylistSmallArea.init = function(self,parent,fname)

	local top = self
	self.parent = parent
	
	local fid = fname or "categarylist_small_area"
	
	GmCtrl.ControlBase.init(self,parent,fid)
	
	self:set_visible(false)
	
	self.ctrls['title'] = self:get_child('title')
	self.ctrls['title']:set_click(	function(obj)
																			top:jump_list(top.data,self.data)
		 										 						end)	
	
	self.title = {}
	self.ptitle = {}
	self.pimg = {}
	
	self.func = {}
	for i = 1,3 do
		self.title[i] = self:get_child('title'..tostring(i))
		self.ptitle[i] = self:get_child('ptitle'..tostring(i))
		self.pimg[i] = self:get_child('pimg'..tostring(i))
		self.func[i] = 	function(obj)
											local innerdata = obj.data or top.data
											top:jump_list(top.data,innerdata)
										end
		self.title[i]:set_click(self.func[i])	
		self.ptitle[i]:set_click(self.func[i])	
		self.pimg[i]:set_click(self.func[i])	
	end

end



categarylistSmallArea.set_data = function(self,data)
	self.data = data
	self:set_childs_inner_text(data)
	if data['object'] and table.size(data['object']) > 0 then
		local osort = 1
		for a,b in pairs(data['object']) do	
			if b['attr'] and b['attr']['imgsrc'] then
				local imgsrc = g_serverRoot.."public/upload/"..b['attr']['imgsrc']['attrvalue']
				self.pimg[osort].data = b['parent']
				self.pimg[osort]:set_attr("src",imgsrc)
			end
			self.title[osort]:set_inner_text(b['objecttitle'])
			self.ptitle[osort]:set_inner_text(b['parent']['title'])
			self.title[osort].data = b['parent']
			self.ptitle[osort].data = b['parent']
			osort= osort + 1
		end
	end
end
