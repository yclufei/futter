
g_screenType = "pad"

require( g_mainModule.."/public/inc" )
		
require(g_mainModule..'/'..g_screenType..'/item/inc')
require(g_mainModule..'/'..g_screenType..'/area/inc')
require(g_mainModule..'/'..g_screenType..'/page/inc')

require( g_mainModule.."/"..g_screenType.."/main/script/messagebox")
require( g_mainModule.."/"..g_screenType.."/main/script/main")
		
startclient = function()

	print("---------------------------- startclient",gApp:screenwidth(),gApp:screenheight(),gInfo['screenwidth'],gInfo['screenheight'])
	
	gMainFrame = gm_ruanjianwaibaojiaoyisuo.ClientWindow( gInfo['screenwidth'],gInfo['screenheight'] )
	
	print("---------------------------- startclient end")

end