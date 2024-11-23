
gr_module("GmBase")

xiguadushunet = inherit(GmSql.list,GmBase.CallBack):name("xiguadushunet")

xiguadushunet.init = function (self)

	local top = self
	
	GmSql.list.init(self,gInfo['path']..'/'..g_local_db_name,'novel')
	GmBase.CallBack.init(self)
	
	self.base = 'http://xiguadushu.com/bookchat/'
		
end


xiguadushunet.instance = nil


xiguadushunet.get_instance = function(pagecount)
	if GmBase.xiguadushunet.instance == nil then
		GmBase.xiguadushunet.instance = GmBase.xiguadushunet(pagecount)
		GmBase.xiguadushunet.instance:init_table()
	end
	return GmBase.xiguadushunet.instance
end



--[[
http://xiguadushu.com/bookchat/api/v2/book/lists?page=1&size=12&sort=latest-recommend
http://xiguadushu.com/bookchat/api/v2/book/lists?page=1&cid=95&size=10&sort=popular


http://xiguadushu.com/bookchat/api/v2/book/lists?page=1&cid=0&size=100&sort=new 首页
http://xiguadushu.com/bookchat/api/v2/book/menu?book_id=1304&page=1&size=20000 章节
东方玄幻  8
武侠仙侠 96
玄幻奇幻 95
科幻灵异 98
网游竞技 99
小说同人 75
历史军事 97
都市言情 31
http://xiguadushu.com/bookchat/api/v2/book/lists?page=1&cid=31&size=10&sort=new 最新
http://xiguadushu.com/bookchat/api/v2/book/lists?page=1&cid=31&size=10&sort=popular 热门
http://xiguadushu.com/bookchat/api/v2/book/lists?page=1&cid=31&size=10&sort=recommend 推荐

http://xiguadushu.com/bookchat/data/1290/2384143.json
http://xiguadushu.com/bookchat/data/1290/2384144.json
]]


xiguadushunet.init_table = function(self)

end



xiguadushunet.data = function(self,book_id,section)
	local top = self
	local url = string.format("http://xiguadushu.com/bookchat/data/%%d/%%d.json",book_id,section)
	local p = {}
	gxo_curl(url,function(data)
			if data['success'] == 1 then
				top.tablename = 'novel'
				for a,b in GSortedPairs4(data['data']) do
					table.print(b)
				end
				top:SetDirty(true)
				top:handle_callback('xiguadushunet.data')
			end
		end,p)
end




xiguadushunet.lists = function(self,param,callback)
	local url = self.base..'api/v2/book/lists?lufei=1&sort=latest-recommend'
	for a,b in pairs(param) do
		url = url..'&'..a..'='..tostring(b)
	end
	print('================================================================================================================================')
	print(url)
	gxo_curl(url,function(netdata) 
		callback('xiguadushunet.lists',param,netdata)
	end)
end




xiguadushunet.menu = function(self,p,callback)
	local url = self.base..'api/v2/book/menu?lufei=1'
	for a,b in pairs(param) do
		url = url..'&'..a..'='..tostring(b)
	end
	gxo_curl(url,function(netdata) 
		callback('xiguadushunet.menu',param,netdata)
	end)
end


-- http://xiguadushu.com/#/pages/cate/cate
xiguadushunet.categories = function(self,callback)
	local url = self.base..'api/v2/book/categories'
	gxo_curl(url,function(netdata) 
		callback('xiguadushunet.categories',{},netdata)
	end)
end


