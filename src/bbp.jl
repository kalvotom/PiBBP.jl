"""
"""
rat(d, k, j) = powermod(16, d - k, 8k + j) / (8k + j)

"""
"""
frac_part(x) = x - floor(x)

"""
"""
function sigma(d, j)
  r = 0.
  for k in 0:d
    r = frac_part(r + rat(d, k, j))
  end

  k = d + 1
  u = 1 / (16^(k - d) * (8k + j)) 
  while u > eps(Float64)
    r += u
    k += 1
    u = 1 / ((16^(k-d))*(8k + j))
  end

  return frac_part(r)
end

"""
"""
function digpi(d)
  r = 4*sigma(d, 1) - 2*sigma(d, 4) - sigma(d, 5) - sigma(d, 6)
  return floor(Int, 16*frac_part(r))
end
