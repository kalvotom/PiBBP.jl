
"""
For integers \$a\$, \$b\$, and \$n\$ efficiently compute
\$a^b \\bmod n\$.
"""
@fastmath function power_mod(a, b, n)
  r = 1
  while b > 0
    if isodd(b)
      r = r * a % n
    end
    b = div(b, 2)
    a = a * a % n
  end
  return r
end

"""
For integer \$d\$, \$k\$, and \$j\$ compute
\\[ ( 16^{d-k} \\bmod 8k + j ) / (8k + j). \\]
"""
ratio(d, k, j) = power_mod(16, d - k, 8k + j) / (8k + j)

"""
Fractional part of a real number \$x\$.
"""
frac_part(x) = x - floor(x)

"""
For integer \$d\$ and \$j\$ computes the fractional part of
\\[ \\sum_{k=0}^d \\frac{16^{d-k} \\bmod 8k+j}{8k+j} + \\sum_{k=d+1}^\\infty \\frac{1}{16^{k-d} (8k+j)}. \\]
"""
function sigma(d, j)
  r = 0.
  @fastmath @simd for k in 0:d
    r += ratio(d, k, j)
    if r > 1.0
      r = frac_part(r)
    end
  end

  kk  = 8. * (d + 1) + j
  u   = 1 / 16
  rat = u / kk

  @fastmath while rat > eps(Float64)
    r   += rat
    kk  += 8.
    u   /= 16.
    rat  = u / kk
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
