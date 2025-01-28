#using Pkg
#Pkg.add("Plots")
#Pkg.add("Distributions")
#Pkg.add("Statistics")
#Pkg.add("Random")

using Random, Statistics, Distributions, Plots
# (a) Set up a normal distribution with μ = 5.0 and σ = 10
μ = 5.0
σ = 10.0
dist = Normal(μ, σ)

# (b) Draw 1000 samples from this distribution
N = 1000
samples = rand(dist, N)

# (c) Compute the biased estimator (σ̂²) and unbiased estimator (σ̂_c²)
sample_mean = mean(samples)
biased_variance = sum((samples .- sample_mean).^2) / N
unbiased_variance = sum((samples .- sample_mean).^2) / (N - 1)

# In-built var function
builtin_variance = var(samples)

# Display results for the first iteration
println("Biased variance estimate: ", biased_variance)
println("Unbiased variance estimate: ", unbiased_variance)
println("In-built variance function result: ", builtin_variance)

# (d) Repeat steps (a)–(c) 150,000 times and compute the averages
repeats = 150_000
biased_variances = Float64[]
unbiased_variances = Float64[]
for _ in 1:repeats
    samples = rand(dist, N)
    sample_mean = mean(samples)
    push!(biased_variances, sum((samples .- sample_mean).^2) / N)
    push!(unbiased_variances, sum((samples .- sample_mean).^2) / (N - 1))
end

mean_biased_variance = mean(biased_variances)
mean_unbiased_variance = mean(unbiased_variances)

println("Average biased variance over 150,000 trials: ", mean_biased_variance)
println("Average unbiased variance over 150,000 trials: ", mean_unbiased_variance)
println("Theoretical variance: ", σ^2)

# (e) Plot a histogram of the sample mean
sample_means = [mean(rand(dist, N)) for _ in 1:repeats]
histogram(sample_means, bins=50, normalize=true, label="Sample Mean Distribution", xlabel="Sample Mean", ylabel="Density")
normal_dist_for_means = Normal(μ, σ / sqrt(N))
x = range(μ - 3σ/sqrt(N), μ + 3σ/sqrt(N), length=1000)
plot!(x, pdf(normal_dist_for_means, x), label="Theoretical Normal Distribution", color=:red) 


