


gr_module("gm_minjieyingshi")

texteditArea = inherit(GmBase.Node):name("texteditArea")

texteditArea.init = function (self,parent)
	
	local top = self
	
  self.parent = parent
  
  if self.parent then
		GmBase.Node.init_by_parent(self,self.parent, "texteditArea" )
	end
	
	self.txtarea = self:get_child('txtarea')
	self.txtarea:set_keydown(function(crl,key)
															local txt = top.txtarea:get_outer_html()
															print('set_keyup',txt)
														end)
														
														

	
end

