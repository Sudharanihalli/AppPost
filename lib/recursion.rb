module Recursion
    def self.factorial(n)
      return 1 if n.zero? || n == 1
  
      n * factorial(n - 1)
    end
  end