
	require("manager/middle/share/script/classattrupdate")
	require("manager/middle/share/script/objectattrupdate")
	require("manager/middle/share/script/classattradd")
	require("manager/middle/share/script/objectdescupdate")
	require("manager/middle/share/script/objectdesc")
	require("manager/middle/share/script/treeadd")
	require("manager/middle/share/script/classattr")
	require("manager/middle/share/script/treelist")
	require("manager/middle/share/script/treeupdate")
	require("manager/middle/share/script/treeselect")
	require("manager/middle/share/script/treedelete")
	require("manager/middle/share/script/objectattradd")
	require("manager/middle/share/script/objectdescadd")
	require("manager/middle/share/script/first")
	require("manager/middle/share/script/relationadd")
	require("manager/middle/share/script/relationupdate")	
	require("manager/middle/share/script/config")							
	require("manager/middle/share/script/configadd")
	require("manager/middle/share/script/configupdate")
	require("manager/middle/share/script/chatFrame")
	require("manager/middle/share/script/loginFrame")
	
	
	require("manager/middle/area/script/area_attribute_list")
	require("manager/middle/area/script/area_relation_list")
	require("manager/middle/area/script/area_object_relation_list")
	require("manager/middle/area/script/area_mainmenu")
	
	
	
	require("manager/middle/share/script/pop_treelist")
	require("manager/middle/share/script/pop_list")
	require("manager/middle/share/script/pop_objectlist")

	require("manager/big/script/mainWindow")


	require("base/middle/middle")


startmanager = function()

	gManagerMainFrame = GmManager.ManagerWindow(gInfo.screenwidth,gInfo.screenheight )

end