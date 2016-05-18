using PiBBP
using Base.Test

# write your own tests here
@test digpi(0) == 2
@test digpi(1000000) == 6
