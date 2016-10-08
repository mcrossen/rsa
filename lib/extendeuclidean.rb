module ExtendedEuclidean
  # find the Greatest Common Denominator of two values
  def self.GCD(a, b)
    larger = a > b ? a : b
    smaller = a > b ? b : a
    if smaller > 0
      GCD(smaller, larger % smaller)
    else
      larger
    end
  end

  # find the multiplicative inverse of two numbers using the extended euclidean algorithm
  def self.inv_mult(modulus, num)
    last_remainder = modulus.abs
    remainder = num.abs
    x, last_x = 0, 1
    y, last_y = 1, 0
    while remainder != 0
      last_remainder, (quotient, remainder) = remainder, last_remainder.divmod(remainder)
      x, last_x = last_x - quotient*x, x
      y, last_y = last_y - quotient*y, y
    end
    raise if last_remainder != 1
    (last_x * (modulus < 0 ? -1 : 1)) % num
  end

end
