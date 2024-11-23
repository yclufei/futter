	

--[[
local tb = {}
tb['info'] = {}
tb['info']['name'] = '音频名称111222'
tb['info']['fs'] = 44100
tb['data'] = {}

for i=1,2 do
	tb['data'][i] = {}
	for j=1,7 do
		tb['data'][i][j] = {}
		tb['data'][i][j]['margin'] = math.random(1, 5)
		tb['data'][i][j]['width'] = math.random(1, 4)
		tb['data'][i][j]['frequency'] = j	
	end
end

local str = TableToString(tb)

local file, err = io.open("music2.txt", "w")
file:write(str)
file:close()
]]

---------------------------------------------------------------------------------------------
					
gr_module("gm_minjieyingshi")

createmusicareaArea = inherit(GmCtrl.ControlBase):name("createmusicareaArea")

createmusicareaArea.init = function (self,parent,aid)

	local top = self
	local fid = aid or "createmusicareaArea"
	GmCtrl.ControlBase.init(self,parent,fid )
	
	self.name = self:get_child('name')
	self.fs = self:get_child('fs')
	
	
	self.data = nil
	
	
	
	self.showBar =  self:get_child('showBar')
	self.showBar:set_visible(false)
	
	
	self.set_line_data = function(idx,vtb)		
		if top.lines[idx] == nil then
			top.lines[idx] = top.lines[0]:copy()
			top.lines[idx]:set_parent(top.linesparent)
		end
		top.lines[idx].idx = idx
		top.lines[idx]:data_2_ui(idx,vtb)	
		top.lines[idx]:set_visible(true)
	end
	
	self.readfile = function(fpath)
		top.fpath = fpath
		local file, error = io.open(fpath, "r") 
		if file then
		    local content = file:read("*a")
				top.data = StringToTable(content)
				local info = top.data['info']				
				top.name:set_inner_text(info['name'])
				top.fs:set_inner_text(info['fs'])				
				local data = top.data['data']
				local size = table.size(data)
				for i=1,size do
					top.set_line_data(i,data[i])
				end
		    file:close()
		else
		    print("无法打开文件: ", error)
		end
	end

	self.editArea = self:get_child('editArea')
	--self.editArea:set_scroll_container(true)
	self.editArea.on_scroll_stop = function()
		print('self.editArea.on_scroll_stop')
	end
	self.editArea:set_click(function(ctrl)
		top:clean_cursor()
		top:updatetick()
	end)

	self.btnewfile = self:get_child('btnewfile')
	self.btnewfile:set_click(function(ctrl)
		top:clean()
		
		top.data = {}
		top.data['info'] = {}
		top.data['info']['name'] = '新建音乐'
		top.data['info']['fs'] = 44100
		
		top.data['data'] = {}
		top.data['data'][1] = {}
		top.data['data'][1][1] = {}
		top.data['data'][1][1]['margin'] = 1
		top.data['data'][1][1]['width'] = 30
		top.data['data'][1][1]['frequency'] = 1
					
		top.name:set_inner_text(top.data['info']['name'])
		top.fs:set_inner_text(top.data['info']['fs'])			
			
		local data = top.data['data']
		local size = table.size(data)
		for i = 1,size do
			top.set_line_data(i,data[i])
		end
				
	end)
		
		
	self.btreadfile = self:get_child('btreadfile')
	self.btreadfile:set_click(function(ctrl)
		top:clean()
		local path = top.hostWindow:file_select_dialog()
		if path[0] and fileexist(path[0]) then
			top.readfile(path[0])
		end
	end)
	
	self.btsavefile = self:get_child('btsavefile')
	self.btsavefile:set_click(function(ctrl)
	
		if top.fpath == nil then
			top.fpath = getGBK( top.data['info']['name'] )..'.txt'
		end
		
		-- todo
		local tb = top:make_data()
		--table.print(tb)
		local str = TableToString(tb)
		local file, err = io.open(top.fpath, "w")
		file:write(str)
		file:close()
		
	end)
	
	self.btclosefile = self:get_child('btclosefile')
	self.btclosefile:set_click(function(ctrl)
		top:clean()
		top:updatetick()
	end)
	
	
	
	
		
---------------------------------------------------------------------------------------

	self.btplay = self:get_child('btplay')
	self.btplay:set_click(function(ctrl)
		local ttop = top
		top.showBar:set_visible(true)
		top.showBar.pos = 0;
		local lhpos = top.lines[1]:lineitems_pos()
		top.showBar:animation( lhpos, top:max_pos() + lhpos, 5, "position:absolute;margin-left:%dpx;z-index:6",function()
			ttop.showBar:set_visible(false)
			ttop:updatetick()
		end)
		local cmd = 'python h:\\python38\\music.py '..top.fpath
		os.execute(cmd)
	end)
	
	
	self.linesparent = self:get_child('linesparent')
	self.musicscoreparent = self:get_child('musicscoreparent')
	self.texteditparent = self:get_child('texteditparent')
	self.excelparent = self:get_child('excelparent')
	self.paintparent = self:get_child('paintparent')
	
	
	
	
	
	self.musicscore = gm_minjieyingshi.musicscoreArea(self.musicscoreparent )
	self.textedit = gm_minjieyingshi.texteditArea(self.texteditparent )
	self.excel = gm_minjieyingshi.excelArea(self.excelparent )
	self.paint = gm_minjieyingshi.paintArea(self.paintparent )
	
	
	
	self.hidepanel = function()
		top.linesparent:set_visible(false)
		top.musicscoreparent:set_visible(false)
		top.texteditparent:set_visible(false)
		top.excelparent:set_visible(false)
		top.paintparent:set_visible(false)
	end
	
	
	
	
	
	self.lines = {}
	
	self.lines[0] = gm_minjieyingshi.TimelineArea(self.linesparent)
	self.lines[0].index = 0
	self.lines[0]:set_visible(false)
	
	self.on_insert = false
	
	self.curSelectTimeLine = nil
	self.curSelectTimeLineItem = nil

end


createmusicareaArea.max_pos = function(self)
	local pos = 0
	for a,b in pairs(self.lines) do
		if b.index > 0 and pos < b:max_pos() then
			pos = b:max_pos()
		end
	end
	return pos
end


createmusicareaArea.set_foucus_item = function(self,timeline,tlitem)

	self:clean_cursor()
	
	self.curSelectTimeLine = timeline
	self.curSelectTimeLineItem = tlitem
	
	self.curSelectTimeLine:set_class('tl2')
	
	if self.curSelectTimeLineItem ~= nil then
		self.curSelectTimeLineItem:set_class('ti2')
	end
	
end


createmusicareaArea.clean_cursor = function(self,idx)

	if self.curSelectTimeLine ~= nil then
		self.curSelectTimeLine:set_class('tl1')
		self.curSelectTimeLine:hide_cursor()
	end
	
	if self.curSelectTimeLineItem ~= nil then
		self.curSelectTimeLineItem:set_class('ti1')
	end
	
	self.curSelectTimeLine = nil
	self.curSelectTimeLineItem = nil
	
end




createmusicareaArea.set_insert = function(self)
	self.on_insert = not self.on_insert
	for a,b in pairs(self.lines) do
		b:set_insert(self.on_insert)
	end
	return self.on_insert
end



createmusicareaArea.clean = function(self)

	for a,b in pairs(self.lines) do
		b:hide_cursor()
		b:clean_all_tli()
		b:set_visible(false)
		b.index = -1
	end
	self.data = nil
end


createmusicareaArea.callback = function(self,key,tb)

end



createmusicareaArea.make_data = function(self,data)


	for a,b in pairs(self.lines) do
		local idx ,data = b:ui_2_data()
		if self.data['data'][idx] then
			self.data['data'][idx] = data
		end
	end
	
	return self.data
	
	
end


