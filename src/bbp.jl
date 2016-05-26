"""
For integer \$d\$, \$k\$, and \$j\$ compute
\$\$ 16^{d-k} \\bmod 8k + j ) / (8k + j). \$\$
"""
ratio(d, k, j) = powermod(16, d - k, 8k + j) / (8k + j)

"""
Fractional part of a real number \$x\$.
"""
frac_part(x) = x - floor(x)

"""
For integer \$d\$ and \$j\$ computes the fractional part of
\$\$ \\sum_{k=0}^d \\frac{16^{d-k} \\bmod 8k+j}{8k+j} + \\sum_{k=d+1}^\\infty \\frac{1}{16^{k-d} (8k+j)}. \$\$
"""
function sigma(d, j)
  r = 0.
  for k in 0:d
    r += ratio(d, k, j)
    if r > 1.0
      r = frac_part(r)
    end
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
Compute \$d+1\$th hexadecimal digit of \$\\pi\$. 
"""
function digpi(d)
  r = 4*sigma(d, 1) - 2*sigma(d, 4) - sigma(d, 5) - sigma(d, 6)
  return floor(Int, 16*frac_part(r))
end
