
gr_module("GmUI")

HtmlTestWindow = inherit(GmBase.Window):name("HtmlTestWindow")

HtmlTestWindow.init = function (self,w,h)
	
	local top = self
	
	GmBase.Window.init(self,"ui/htmltest.html")
	
	--self.sysbutton = GmBase.SysButton(self,true,true,true)
	
	self.titlebar = self.mScrollViewParent:get_child('titlebar')
	self.titlebar:set_drag_window(true)
	self.titlebar:set_dblclick(function(ctrl)
		self:maxbox()
	end)

	self.htmldisplay = self.mScrollViewParent:get_child('htmldisplay')
	
	self.filepath = 'D:/GOA/res/yangcunEONLIN/phone/item/html/forumcommentitem.html'
	
	self.testfilebutton = self.mScrollViewParent:get_child('testfilebutton')
	self.testfilebutton:set_click(function(ctrl)
	
	
		local file = io.open(top.filepath, "r")
		local fcontent = file:read("*a")
		io.close(file)
		top.htmldisplay:set_outer_html(fcontent)
		top.htmldisplay:updatetick(true)
		top:updatetick(true)		
		
		
	end)
	
	
	
	self.selectfilebutton = self.mScrollViewParent:get_child('selectfilebutton')
	self.selectfilebutton:set_click(function(ctrl)
	
		local a = top:file_select_dialog()
		top.filepath = a[0]
		
		local file = io.open(top.filepath, "r")
		local fcontent = file:read("*a")
		io.close(file)
		top.htmldisplay:set_outer_html(fcontent)
		top.htmldisplay:updatetick(true)
		top:updatetick(true)		
		
		
	end)
	

	
	

	self.checkchildren = function(key,tb)
		local ret = {}
		local repstr = '.'..key
		for ckey,cvalue in pairs(tb) do
			local newkey = string.replace(ckey,repstr..'.','.')
			if type(cvalue) == 'table' then
				ret[newkey] = top.checkchildren(ckey,cvalue)
			elseif type(cvalue) == 'string' then
				ret[newkey] = string.replace(cvalue,repstr,'')
			else
				ret[newkey] = cvalue
			end
		end
		return ret
	end



	self.luactrl = {}
	self.children2lua = function(tb,path,rootname,incfile)
	
		if top.luactrl[rootname] ~= nil then
			cerror("ctrl repeat",rootname)
		end
		
		top.luactrl[rootname] = true
		
		local nodefile = io.open (path.."node\\"..rootname..".lua","w")
		
		local luastring = [[		
gr_module("GmUINode")

%s_node = inherit(GmBase.Node):name("%s_node")

%s_node.init = function (self,parent)

	local top = self												
	GmBase.Node.init_by_parent(self,parent,"%s")	
												
]]											

		local fstring = string.format(luastring,rootname,rootname,rootname,rootname)
		nodefile:write(fstring)
		
		incfile:write("\nrequire('temp/node/"..rootname.."')\n")
		incfile:write("\nrequire('temp/"..rootname.."')\n")

		for ckey,cvalue in GSortedStringPairs(tb) do
			print('####',ckey,cvalue)
			if type(cvalue) == 'table' then
				top.children2lua(cvalue,path,ckey,incfile)
				nodefile:write("\t".."self."..ckey.." = GmUI."..ckey.."_ctrl(self)\n\n")
			else
				nodefile:write("\t"..ckey.." = "..cvalue.."\n\n")
			end
		end
		
		nodefile:write("end")
		nodefile:close()
		
		if not fileexist(path..rootname..".lua") then
			local ctrlfile = io.open (path..rootname..".lua","w")
		
			local cluastring = [[		
gr_module("GmUI")

%s_ctrl = inherit(GmUINode.%s_node):name("%s_ctrl")

%s_ctrl.init = function (self,parent)

	local top = self												
	GmUINode.%s_node.init(self,parent)	
												
]]											
			local cfstring = string.format(cluastring,rootname,rootname,rootname,rootname,rootname)
			ctrlfile:write(cfstring)
			ctrlfile:write("end")
			ctrlfile:close()			
		end
		
	end
	
	self.printnodes = self.mScrollViewParent:get_child('printnodes')
	self.printnodes:set_click(function(ctrl)
		print('==========================================================================')
		top.luactrl = {}
		local childrentb = top.htmldisplay:traverse_children()		
		local newtb = top.checkchildren('root',childrentb)
		table.print(newtb)
		local incfile = io.open ("D:\\GOA\\res\\temp\\__include.lua","w")
		top.children2lua(newtb,"D:\\GOA\\res\\temp\\","root",incfile)
		incfile:close()
	end)
	
	self:set_visible(true)
	
	self:set_size(w , h)
	
	self:set_title('HTML test')
	
	self:updatetick()
	
end


HtmlTestWindow.on_sys_button = function(self,stype)
	if stype == "min" then
		self:minbox()
	elseif stype == "max" then
		self:maxbox()
	else
		self:set_visible(false)
		gApp:exit()
	end
	self:updatetick()
end

