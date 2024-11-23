
		
-- D:\GOA\reslibrary\templete\res\page\page.phone.lua.xsl
gr_module("gm_ruanjianwaibaojiaoyisuo")

serviceinfoFrame = inherit(GmBase.FrameBase):name("serviceinfoFrame")

serviceinfoFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_serviceinfo"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	self.field1data = { [3] = '添加案例',  [2] = '修改', [1] = '关闭' }
	
	
	-- areanav
	self.areanav = gm_ruanjianwaibaojiaoyisuo.navArea(self)
	
	self.areanav.rightfunc = function(ctrl)
		local modal = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
		if modal:has_session() then
			local pop = top.hostWindow.popmanager:show_pop('select',true)
			pop:set_title('操作')
			pop:set_data(top.field1data,function(k,v,c)
				top:on_operation(k,v,c)
			end,top)
		else
			top.hostWindow:addNavFrame('login')
		end
	end
	
	self.areanav:set('right','posts')
			
	self.areanav:set('rightcss','fa_bars font42')
	
	self.areanav:set('left','back')
	
	self.areanav:set('leftcss','fa-angle-left font45')
					
	self.areanav:set('title','serviceinfo')
					
	
	
	-- mainarea
	self.mainarea = gm_ruanjianwaibaojiaoyisuo.serviceinfoareaArea(self)
	
	
	
	self:set_style('display:none')

	
end

serviceinfoFrame.on_operation = function(self,k,v,c)
	if self.mainarea.on_operation then
		self.mainarea:on_operation(k,v,c)
	end
end


serviceinfoFrame.set_data_id = function(self,data)
	
	if self.mainarea.set_data_id then
		self.mainarea:set_data_id(data)
	end
				
end


serviceinfoFrame.set_data = function(self,data)

	self.data = data
	
	local modal = gm_ruanjianwaibaojiaoyisuo.clsusermgr.get_instance()
	local usr = modal:get_session('default')
	
	if usr then
		local attrs = usr:GetAttrs()
		if tonumber(attrs["member_uid"]) == tonumber(self.data["authorid"]) then
			self.areanav:set('right','posts')				
			self.areanav:set('rightcss','fa_bars font42')
		else
			self.areanav:set('right',nil)				
			self.areanav:set('rightcss','')
		end
	else
		self.areanav:set('right',nil)				
		self.areanav:set('rightcss','')
	end
	
	if self.areanav.set_data then
		self.areanav:set_data(data)
	end
			
	if self.mainarea.set_data then
		self.mainarea:set_data(data)
	end
			
end




serviceinfoFrame.on_show = function(self,key)
			
	if self.mainarea.on_show then
		self.mainarea:on_show(key)
	end
			
end


serviceinfoFrame.on_hide = function(self,key)
			
	if self.mainarea.on_hide then
		self.mainarea:on_hide(key)
	end		
			
end

	


	