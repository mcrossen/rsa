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
      end while ExtendedEuclidean.GCD(@e, @phin) != 1
      @d = ExtendedEuclidean.inv_mult(@e, @phin)
    end
  end

  def self.large_prime
    OpenSSL::BN::generate_prime(PRIME_SIZE, true).to_i
  end
end
