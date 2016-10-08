# this adds functionality to the fixnum and bignum classes.
# it gives those classes a new method that does modular exponentiation
module ModularExponent
  # notice how this is different than 'mod_exp' (the openssl version of the same method)
  def modexp(exponent, mod)
    base = nil # set the base to zero, so the loop recognizes the initial pass
    # loop through every bit of the exponent
    exponent.to_s(2).split(//).reverse.reduce(1) do |product, bit|
      # set the base to self if in the first pass, else square it
      base = base.nil? ? self % mod : (base ** 2) % mod
      # perform the multiply and mod
      bit == "1" ? (product * base) % mod : product
    end
  end
end
Fixnum.send(:include, ModularExponent)
Bignum.send(:include, ModularExponent)
