
		
-- D:\GOA\reslibrary\templete\res\page\page.pc.lua.xsl
gr_module("gm_minjieyingshi")

forgetformFrame = inherit(GmBase.FrameBase):name("forgetformFrame")

forgetformFrame.init = function (self,parent,frameid)

	local top = self
	local win = parent.hostWindow
	
	local fid = frameid or "templete_forgetform"
	GmBase.FrameBase.init_by_parent(self,parent,fid)
	
	
	
	self.mainarea = self.areaforgetformarea
	
	self:set_style('display:none')

	
end


forgetformFrame.set_data_id = function(self,data)
		
end


forgetformFrame.set_data = function(self,data)

	self.data = data
	
	
end




forgetformFrame.on_show = function(self)
		
end


forgetformFrame.on_hide = function(self)
		
end

	


	