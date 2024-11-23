
netField = {}

function makeNetField_test(tbname,itemdata)
	if netField[tbname] == nil then
		netField[tbname] = {}
	end
	for a,b in pairs(itemdata) do
		netField[tbname][a] = type(b)
	end
--	table.print(netField)
end

require("base/modal/city58/net")
require("base/modal/ecshop/net")
require("base/modal/im/net")
require("base/modal/qscms/net")
require("base/modal/supesite/net")
require("base/modal/tipask/net")
require("base/modal/ucenter/net")
require("base/modal/discuz/net")
require("base/modal/xiguadushu/net")
require("base/modal/mhk/net")
require("base/modal/modoer/net")
require("base/modal/translate" )
require("base/modal/datasource" )
require("base/modal/gxo/user")
require("base/modal/czy/net")
