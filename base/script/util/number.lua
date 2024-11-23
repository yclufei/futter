function getIntPart(x)
	if x <= 0 then
	   return math.ceil(x);
	end
	
	if math.ceil(x) == x then
	   x = math.ceil(x);
	else
	   x = math.ceil(x) - 1;
	end
	return x;
end

math.roundOff = function(num)
    local m,n = math.modf(num)
    local u,v = math.modf(n * 10)
    if u > 5 then
    	return m + 1
    else
    	return m
    end
end