
		
gr_module("gm_minjieyingshi")

excelArea = inherit(GmBase.Node):name("excelArea")

excelArea.init = function (self,parent)

  self.parent = parent
  
  if self.parent then
		GmBase.Node.init_by_parent(self,self.parent, "excelArea" )
	end
	
end

