

gr_module("gm_minjieyingshi")

musicscoreArea = inherit(GmBase.Node):name("musicscoreArea")

musicscoreArea.init = function (self,parent)

  self.parent = parent
  
  if self.parent then
		GmBase.Node.init_by_parent(self,self.parent, "musicscoreArea" )
	end
	
end

