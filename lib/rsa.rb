require "extendeuclidean"
require "openssl/bn"
require "securerandom"

PRIME_SIZE = 512

module RSA
  class Keys
    attr_reader :e, :p, :q, :n, :phin, :d

    def initialize
      @e = 65537
      @p = nil
      @q = nil
      @n = nil
      @phin = nil
      begin
        @p = RSA::large_prime
        @q = RSA::large_prime
        @n = @p*@q
        @phin = (@p-1)*(@q-1)
        # until Phi(n) is relatively prime to 65537, keep calculating new p and q values
      end while ExtendedEuclidean.GCD(@e, @phin) != 1
      @d = ExtendedEuclidean.inv_mult(@e, @phin)
    end
  end

  # wrapper around the library method to generate large primes
  def self.large_prime
    OpenSSL::BN::generate_prime(PRIME_SIZE, true).to_i
  end
end
