
require("manager/share/script/about")
require("manager/share/script/feedback")
require("manager/share/script/otherapp")
require("manager/share/script/register")
require("manager/share/script/update")
require("manager/share/script/protocal")
require("manager/share/script/setting")
require("manager/share/script/ursinfo")
require("manager/share/script/forgetpwd")
require("manager/share/script/login")
require("manager/share/script/urscenter")
require("manager/share/script/first")
require("manager/share/script/area_mainmenu")

require("manager/middle/script/mainWindow")


require("base/middle/middle")


start = function()

	gMainFrame = nil

	gApp = GmBase.App()
	
	gInfo = gApp:get_sys_info()

	gMainFrame = GmManager.MainWindow(gInfo.screenwidth,gInfo.screenheight )

end 

