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
    x = 0
    last_x = 1
    y = 1
    last_y = 0
    while remainder != 0
      quotient = last_remainder / remainder
      temp_remainder = remainder
      remainder = last_remainder % remainder
      last_remainder = temp_remainder
      temp_x = x
      x = last_x - quotient*x
      last_x = temp_x
      temp_y = y
      y = last_y - quotient*y
      last_y = temp_y
    end
    raise if last_remainder != 1
    (last_x * (modulus < 0 ? -1 : 1)) % num
  end

end
