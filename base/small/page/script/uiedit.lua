-- 关于
gr_module("GmBase")

uieditFrame = inherit(GmBase.FrameBase):name("uieditFrame")

uieditFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_uieditFrame"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	


	self.htmlshow = self:get_child('htmlshow')
			
	self.htmleditor = self:get_child('htmleditor')
			
	self.showbt = self:get_child('show')
	self.showbt:set_click(function(link)			
			
		local xt = top.htmleditor:get_text()
		top.htmlshow:set_outer_html_file(xt)  			
	end)


 
end

  


uieditFrame.on_show = function(self)
				
end

	