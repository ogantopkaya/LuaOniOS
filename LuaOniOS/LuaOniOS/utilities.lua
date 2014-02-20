function calculate(n)
	return factorial(n)
end


function square (n)
	return (n^2)
end

function factorial (n)
	if n == 0 then
		return 1
	else
		return n * factorial(n-1)
	end
end