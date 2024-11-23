

gr_module("gm_ruanjianwaibaojiaoyisuo")

MessageBox = inherit(GmBase.FrameBase):name("MessageBox")

MessageBox.init = function (self,parent)
	local top = self
	GmBase.FrameBase.init(self,parent,"messagebox")
	self.msgtext = self:get_child('msgtext')
	self.on_timeout = function(self)
		self:remove_timeout()	
		self:set_style('display:none')
		self:updatetick()
	end
	
	self.click1 = self:get_child("click1")
	self.click1:set_click(	function(self)
														print("MessageBox uninit")
													 	top:set_style('display:none')
													 	top:updatetick()
													 end)
end


MessageBox.set_data = function(self,msgtext)
	self.msgtext:set_inner_text(msgtext)
	self:set_style('dispaly:block')
	self:layout()
	self:updatetick(true)
	self:set_timeout(12)
end 



