
	
gr_module("gm_ruanjianwaibaojiaoyisuo")

thirdloginArea = inherit(GmCtrl.ControlBase):name("thirdloginArea")

thirdloginArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "thirdloginArea"
	GmCtrl.ControlBase.init(self,parent,fid )

	self.func = function(ctrl)
--		table.print(ctrl.data)
	end
	
end

	

thirdloginArea.callback = function(self,key,data)
	local tb = {}
	tb['data'] = data
	self:set_data(tb)
		return true
end


	
	
	