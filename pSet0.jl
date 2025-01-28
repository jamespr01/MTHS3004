using CairoMakie

# (a) Construct an array of functions fn(x) = cos(n * x), for n = 1 to 10
function_array = [x -> cos(n * x) for n in 1:10]

# (b) Pre-allocate an n × m matrix A, with n = 10 rows and m = 30 columns
n, m = 10, 30
A = zeros(n, m)  # Pre-allocate the matrix
# A = Matrix{Float64}(undef, n, m)  # Alternative method

# Define the xm values (for example, linearly spaced values from 0 to 2π)
x_values = range(0, 2π, length=m)
#x_values = range(-pi, pi, length=m)  # Alternative, same results

# (c) Fill the matrix such that A[n, m] = fn(xm)
for i in 1:n
    for j in 1:m
        A[i, j] = function_array[i](x_values[j])  # Apply the function to xm
    end
end

# Display the resulting matrix
#println("Matrix A: $A")
begin
	F3 = Figure()
	ax3 = Axis(F3[1,1])
	for i in 1:2
		lines!(ax3, x_values, A[i,:])
	end
	F3
end

function innerProduct(a, b)
	lenA = length(a) 
	lenB = length(b)
	if (lenA != lenB)
		println("Length of vectors not the same, a = $lenA, b = $lenB")
		return
	end
	# inner product: elementwise multiplication
	sum = 0
	for i in 1:lenA
		sum += a[i] * b[i]
	end
	return sum
end

function innerProductV2(a, b)
	lenA = length(a) 
	lenB = length(b)
	if (lenA != lenB)
		println("Length of vectors not the same, a = $lenA, b = $lenB")
		return
	end
	return sum(a.*b) 
end

innerProductV2([1,2,3], [1,2,3])
innerProduct([1,2,3], [1,2,3])
innerProduct([1,2,3], [1,2,3,4])
innerProductV2([1,2,3], [1,2,3,4])
