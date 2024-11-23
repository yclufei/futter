
gr_module("GmBase")

vscrollbarArea = inherit(GmCtrl.ControlBase):name("vscrollbarArea")

vscrollbarArea.init = function(self,parent)

	local top = self

	GmCtrl.ControlBase.init(self,parent,"vscrollbararea")
	
	self.scrollcontent = self:get_child("vscrollbarcontent")
	self.scrollcontent:set_scroll_container(true)
	self.scrollcontent:set_step_container(2)
	self.scrollcontent.on_step = function(self,a,b,c,d)
		print('self.scrollcontent.on_step',a,b,c,d)
	end
	
	self.sizectrl = self:get_child("sizectrl")
	
	--self.sizectrl:set_style('width:'..(gInfo['screenwidth'])..'px')
	
	
	self.items = {}
	for i=1,30 do
		self.items[i] = self:get_child('bt'..tostring(i))
		self.items[i]:set_click(function(ctrl)
			top:on_select(ctrl.data)
		end)
	end

end


	
vscrollbarArea.on_select = function(self,data)
	self.hostWindow:exec_action(self ,'switch', data)
end

	

vscrollbarArea.clean = function(self)
	local len = table.size(self.items)
	for i=1,len do
		self.items[i]:set_style('display:none')
	end
end

vscrollbarArea.set_data = function(self,tb)
	self:clean()
	local i = 1
	for a,b in GSortedPairs4(tb) do
		b.sortid = b.typeid
		b.subject = b.name
		self.items[i].data = b
		self.items[i]:set_inner_text(b.subject)
		self.items[i]:set_style('display:inline-block')
		i = i + 1
	end
	self.sizectrl:set_style('width:'..(i*140)..'px')
	self.scrollcontent:set_scroll_pos(220,0)
	self:layout()
end