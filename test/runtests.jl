##
#
# PiBBP tests
#

using PiBBP
using Base.Test

#
# Particular digits
#

@test digpi(0)       == 2
@test digpi(1000000) == 6

#
# It actually computes fractional part of $\pi$.
#

ds = pmap(digpi, 0:14)
z  = sum(j -> ds[j] / 16^j, 1:length(ds))

@test_approx_eq Float64(pi - 3.) z
