

require("config")

g_module = {}
	
require("base/module")

g_kefu = "gxosoft@iz941erws6dz"
	

gModule = {}

gModule['ui'] = function()
		require("base/small/small")	
		require("ui/DockPanel")		
		require("ui/pop")			
		require("ui/side")		
		require("ui/lua/__include")	
		require("ui/main")	
		global_main = GmUI.uiWindow(gApp:screenwidth(),gApp:screenheight())
end



function initModule(modulename)

		gApp = GmBase.App()	
			
		gXmpp = GmBase.Xmpp(g_serverip)
		
		gInfo = gApp:get_sys_info()
			
		if gInfo['os'] == 'win' and cmd ~= 2 and cmd ~= 4 then
		
			gApp:on_framesys_update(1)
			--[[
			gInfo['screenwidth'] = 650
			gInfo['screenheight'] = 1200
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
			]]
		end
		
		g_mainModule = modulename
		
		g_screenType = "phone"
		
		g_serverAddress = g_serverRoot.."framework/index.php/"	
	
			
	
		
		if gModule[modulename] ~= nil then
		
			gModule[modulename]()
			
		else
			

			require("base/small/small")
		

			require( g_mainModule.."/"..g_screenType.."/module" )

			
		
		end
		
end


start = function(md) 
	
	initModule(md)
	
	if startclient then	

		local status,err = pcall(startclient)
		if not status then
		    local code = err.code and tonumber(err.code) or 500
		    local msg = err.msg and tostring(err.msg) or "Unknown error occurred"
		    print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ERROR',code,msg )
		end	
		
	else	
		print("---------------------------- no startclient",startclient)	
	end	
end

