-- 输入框类，有背景文字功能
gr_module("GmCtrl")

InputText = inherit(GmBase.Node):name("InputText")

InputText.init = function (self,window,elename)
    local top = self
    GmBase.Node.init(self,window,elename)
end



InputText.initElement = function(self,parent,elename)
	
  local success = parent:_get_child(self[0],elename)
  if not success then    	
		print(debug.traceback())
  end 
  
end


InputText.setBgWords = function(self,bgword)
	--[[
    self.bgwords = bgword
    self:add_event_callback("focus")
    self:add_event_callback("blur")
    self:set_text(self.bgwords)
    ]]
end


InputText.on_focus = function(self)
	local txt = self:get_text()
	if txt == self.bgwords then
		--self:set_text("")
	end
end

InputText.on_blur = function(self)
	local txt = self:get_text()
	if txt == "" then
		--self:set_text(self.bgwords)
	end
end