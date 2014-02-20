function isAllowedToExecute(str)
	if string.len(str) > 4 then 
		return true
	else
		return false
	end
end


consoleYPosition = 40

function updateConsole(obj)
	callUpdateConsoleFunctionInObjC(obj)
end