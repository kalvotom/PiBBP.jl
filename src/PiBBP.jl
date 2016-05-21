"""
A toy Julia implementation of [Bailey-Borwein-Plouffe (BBP) alogithm](http://www.davidhbailey.com/dhbpapers/bbp-alg.pdf) for computation
of hexadecimal digits of Pi.
"""
module PiBBP
 
export digpi

include("bbp.jl")

end # module
