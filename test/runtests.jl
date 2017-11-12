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

@test pi - (3 + sum(digpi(n) / 16^(n+1) for n in 0:14)) ≈ 0
@test pi - (3 + sum(digpi(n) / big(16)^(n+1) for n in 0:64)) ≈ 0
