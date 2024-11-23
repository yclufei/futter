


gr_module("gm_minjieyingshi")

paintArea = inherit(GmBase.Node):name("paintArea")

paintArea.init = function (self,parent)

  self.parent = parent
  
  if self.parent then
		GmBase.Node.init_by_parent(self,self.parent, "paintArea" )
	end
	
end

