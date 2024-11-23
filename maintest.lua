
require("config")


g_module = {}
	
require("base/module")


gModule = {}




function initLua(cmd )
	
		gApp = GmBase.App()	
	
		gInfo = gApp:get_sys_info()
				
		if gInfo['os'] == 'win' and cmd ~= 2 and cmd ~= 4 then
		
			gApp:on_framesys_update(1)
			
			gInfo['pushid'] = '5403254971262445332'
			gInfo['location'] = {}
			gInfo['location']['y'] = 111.76572118541
			gInfo['location']['x'] = 22.186575376707
			
			if tonumber(gInfo[ "screenwidth" ]) > 900 then			
        gInfo[ "vretina" ] = 3
        gInfo[ "retina" ] = 3
        gInfo[ "mretina" ] = 3
        gInfo[ "retinaX" ] = "3x" 
      elseif tonumber(gInfo[ "screenwidth" ]) < 500 then
        gInfo[ "vretina" ] = 1
        gInfo[ "retina" ] = 1
        gInfo[ "mretina" ] = 1
        gInfo[ "retinaX" ] = "1x" 
      else
        gInfo[ "vretina" ] = 2
        gInfo[ "retina" ] = 2
        gInfo[ "mretina" ] = 2
        gInfo[ "retinaX" ] = "2x" 
      end
      
		end
		
	print("----------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ initLua begin")
		
	if cmd == -1 then --------------------------------------------------- yicamera
		
		g_mainModule = "yicamera"
		g_screenType = "pc"
		require( g_mainModule.."/module" )

	elseif cmd == 0 then --------------------------------------------------- manager
		
		
		g_serverAddress = g_serverRoot.."framework/index.php/"

		g_mainModule = "manager"
		g_screenType = "big"
		
		require( "ui/public/CONST" )
		require( "ui/public/util" )
		require( g_mainModule.."/module" )
		

		startmanager()
		
	
	elseif cmd == 1 then --------------------------------------------------- lovemuseum 1
	
		g_serverAddress = g_serverRoot.."framework/index.php/"	
	
		g_mainModule = "lovemuseum"		

		require( g_mainModule.."/public/CONST" )
		require( g_mainModule.."/public/util" )
		require( g_mainModule.."/phone/module" )

		require("base/small/small")
		
		require("base/small/pop/script/popfilelist")
		require("base/small/pop/script/popdirlist")
		require("base/small/pop/script/pop_objectlist")
		require("base/small/pop/script/pop_treelist")
		require("base/small/pop/pop")
		
		require("lovemuseum/phone/share/share")
		require("lovemuseum/phone/control/control")
		require("lovemuseum/phone/main/script/messagebox")
		require("lovemuseum/phone/main/script/mainWindow")
		
		
	elseif cmd == 123 then --------------------------------------------------- hospital 123
	
		g_serverAddress = g_serverRoot.."framework/index.php/"	
	
		g_mainModule = "hospital"		
			
		require( "user/module" )
		require( g_mainModule.."/public/CONST" )
		require( g_mainModule.."/public/util" )
		require( g_mainModule.."/phone/module" )

		require("base/small/small")
		
		require("base/small/pop/script/popfilelist")
		require("base/small/pop/script/popdirlist")
		require("base/small/pop/script/pop_objectlist")
		require("base/small/pop/script/pop_treelist")
		require("base/small/pop/pop")
		
		require("hospital/phone/share/share")
		require("hospital/phone/control/control")
		require("hospital/phone/main/script/messagebox")
		 
		require("hospital/phone/main/script/mainWindow")
		
	elseif cmd == 321 then --------------------------------------------------- anhui11xuan5 321
	
		g_serverAddress = g_serverRoot.."framework/index.php/"	
		
		g_screenType = "pad"
		g_screenType = "pc"
		g_screenType = "phone"
		
		
		if g_screenType ~= 'pc' then
		
			gInfo['screenwidth'] = 640
			gInfo['screenheight'] = 1400 
      gInfo[ "vretina" ] = 2
      gInfo[ "retina" ] = 2
      gInfo[ "mretina" ] = 2
      gInfo[ "retinaX" ] = "2x" 
        
    end
		
		g_mainModule = "fucai3d"
		g_mainModule = "pailie3"		
		g_mainModule = "qixingcai"			
		g_mainModule = "pailie5"		   
		g_mainModule = "hezongweike"
		g_mainModule = "anhui11xuan5"			
		g_mainModule = "qilecai"
		g_mainModule = "yangchunrencai"	
		g_mainModule = "yangchunchengshi"	
		g_mainModule = "yangchuntiaozaoshichang"
		g_mainModule = "yangchunchengshibaishi"	
		g_mainModule = "yangchunchongwu"
		g_mainModule = "yangchunfenleixinxi"
		g_mainModule = "yangchunjiazheng"
		g_mainModule = "yangchunrenrenwang"
		g_mainModule = "yangchunshangquan"
		g_mainModule = "yangchunzhaopin"
		g_mainModule = "yangchunzhulibang"
		g_mainModule = "yangchunfangcun"		
		g_mainModule = "yangchunmamaquan"
		g_mainModule = "jisushishicai"
		g_mainModule = "xifangcaifu"
		g_mainModule = "banyunhecangchuyeluntan"
		g_mainModule = "yunshuyeluntan"
		g_mainModule = "meiyeluntan"
		g_mainModule = "yuleyangchun"
		g_mainModule = "yangchunjie"
		g_mainModule = "xianggangcai"
		g_mainModule = "wabu"
		g_mainModule = "kuangcailuntan"
		g_mainModule = "yangchunbaishitong"
		g_mainModule = "daletou"		
		g_mainModule = "lovemuseum"
		g_mainModule = "baishiyangchun"
		g_mainModule = "zibenluntan"
		g_mainModule = "63xiaoshuowang"	
		g_mainModule = "H63xiaoshuowang"	
		g_mainModule = "adv"
		g_mainModule = "windoor"
		g_mainModule = "bimu"
		g_mainModule = "zibenluntan"
		g_mainModule = "taobaoluntan"
		g_mainModule = "taobaoluntan"
		g_mainModule = "wanweiweike"
		g_mainModule = "qiyemaichang"
		g_mainModule = "qihuochaoshi"
		g_mainModule = "zhiboluntan"
		g_mainModule = "zhanhuichaoshi"
		g_mainModule = "pinduoduoluntan"
		g_mainModule = "qiyemaichang"
		g_mainModule = "baozhuangyongzhiluntan"
		g_mainModule = "qingyuanONLIN"
		g_mainModule = "yangcunEONLIN"
		g_mainModule = "yimeijiayuan"
		g_mainModule = "gufen"
		g_mainModule = "minjieyingshi"
		g_mainModule = "ruanjianwaibaojiaoyisuo"
		g_mainModule = "xinbanchunzhongyun"
		
		
		
		g_local_db_name = g_mainModule
		
		
		require("base/small/small")
		
		require( g_mainModule.."/"..g_screenType.."/module" )
		
		
		local cyznet = GmBase.czynet.get_instance()
		
		--[[
		
		require("ui/htmltest")		
		global_test = GmUI.HtmlTestWindow(gApp:screenwidth(),gApp:screenheight())
			
		require("ui/icon")		
		global_test = GmUI.IconWindow(gApp:screenwidth(),gApp:screenheight())
		
		]]
		
		
		
	elseif cmd == 2 then --------------------------------------------------- yicamera 2
	
		g_mainModule = 'yicamera'
		g_screenType = 'pc'
		g_subModule = 'client'

		require("config")
		
		gWXWindow = nil
		gMainWindow = nil
	
		require( g_mainModule.."/module")
		gWXWindow = GmYiCamera.WXWindow()
		gMainWindow = GmYiCamera.MainWindow(gInfo.screenwidth,gInfo.screenheight )

	elseif cmd == 4 then --------------------------------------------------- baccarat 4
	
		g_mainModule = 'baccarat2'
		g_screenType = 'pc'
		g_subModule = 'client'

		require("config")
		
		gWXWindow = nil
		gMainWindow = nil
	
	
		require( g_mainModule.."/"..g_screenType.."/module")
		
	elseif cmd == 3 then --------------------------------------------------- ecg
	
		g_mainModule = "ecg"		
		g_serverAddress = g_serverRoot.."trafficweb/index.php/"	
		require("base/small/small")
		require("ecg/historyItem")
		require("ecg/messagebox")
		require("ecg/historyFrame")
		require("ecg/reportFrame")
		require("ecg/startFrame")
		require("ecg/runFrame")
		require("ecg/ui")		
		if gInfo["os"] == "win" then
			global_test = GmEcg.uiWindow(960,540)
		else
			global_test = GmEcg.uiWindow(gInfo.screenwidth,gInfo.screenheight)
		end
		
		
	elseif cmd == 44 then --------------------------------------------------- ecg
	
		g_mainModule = "windoor"
		g_screenType = 'pc'

		require(g_mainModule.."/module")
		
	elseif cmd == 1244 then --------------------------------------------------- ecg
	
		g_mainModule = "baccarat"
		g_screenType = 'pc'

		require(g_mainModule.."/module")
		
	elseif cmd == 55 then --------------------------------------------------- ecg
	
		g_mainModule = "test"		

		require("test/main")
		global_test2 = GmTest.uiWindow(900,600)

		
	else --------------------------------------------------- ui	
	
		require("base/small/small")	
		require("ui/DockPanel")		
		require("ui/pop")			
		require("ui/side")		
		require("ui/lua/__include")	
		require("ui/main")	
		--global_main = GmUI.uiWindow(gApp:screenwidth(),gApp:screenheight())
		
		require("ui/htmltest")		
		global_test = GmUI.HtmlTestWindow(gApp:screenwidth(),gApp:screenheight())
		
	end
	
		
end


initLua(321)


---------------------------------------------------------------------------------------------------------------------------------------------------------
--[[

from clearml.backend_api.session.client import APIClient

# Create an instance of APIClient
client = APIClient()
project_list = client.projects.get_all(name="example*")
print(project_list)



global_python = GmBase.python()
global_python:py_init()
local clearml = global_python:import('clearml')
local task = clearml:sub('task')
local clstask = task:sub('Task')
local ret = clstask:call('get_projects')
print('py_import get_projects',clearml,task,clstask,ret)
table.print(ret)
global_python:py_uninit()

]]



--[[
global_python = GmBase.python()

global_python:py_init()

local lufeipython = global_python:import('lufeipython')

lufeipython:call("test_int",12.9,true)

lufeipython:call("test_int2",12.9,true,'c')

global_python:py_uninit()
]]


--[[
global_python = GmBase.python()
global_python:py_init()

local task = global_python:import('clearml.task')

local tsk = task:attr('Task')

local ret = tsk:call('get_projects')

for k,v in pairs(ret[0]) do
	if v:attr('user') ~= '__allegroai__' then
		print('--------------------------------------------------------------------------------------------------------------------------------------------------------',v:attr('name'))
		print('id',v:attr('id'))
		print('name',v:attr('name'))
		print('basename',v:attr('basename'))
		print('user',v:attr('user'))
		print('company',v:attr('company'))
		print('created',v:attr('created'))
		print('tags',v:attr('tags'))
		print('system_tags',v:attr('system_tags'))
		print('last_update',v:attr('last_update'))
		print('description',v:attr('description'))
		print('--------------------------------------------------------------------------------------------------------------------------------------------------------',v:attr('name'))
	end
end

global_python:py_uninit()


pause()

]]

---------------------------------------------------------------------------------------------------------------------------------------------------------

start = function() 
	
	if startclient then	
		startclient()
	else	
		print("---------------------------- no startclient",startclient)	
	end	
	
	--[[
	local xmpp = GmBase.Xmpp('616.pub')
	xmpp.on_connected = function(x,b)
		print('xmpp on_connected',x,b)
	end
	xmpp.on_login = function(x,b)
		print('xmpp on_login',x,b)
	end
	xmpp:user_login('','lufei@616.pub','mother')
	]]
	
end

