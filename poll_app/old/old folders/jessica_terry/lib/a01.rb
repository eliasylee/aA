class Array
  # Write an Array method that returns a bubble-sorted copy of an array
  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)
    prc ||= Proc.new { |num1, num2| num1 <=> num2 }
    sorted = false

    until sorted == true
      sorted = true
      self.each_index do |i|
        next if i == self.length - 1
        if prc.call(self[i], self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end
    self
  end
end

class Array
  # Write an array method that returns a hash where the keys are any element
  # that appears in the array more than once, and the values are sorted arrays
  # of indices for those elements.
  def dups
    dups_hash = Hash.new{[]}
    self.each_with_index do |el, idx|
      dups_hash[el] += [idx]
    end
    dups_hash.select { |key, value| value.length > 1 }
  end
end



# Write a method that finds the first `n` Fibonacci numbers
def fibs_rec(count)
  return [0] if count == 1
  return [0, 1] if count == 2

  last_fibs = fibs_rec(count - 1)
  last_fibs << last_fibs[-1] + last_fibs[-2]
end

class String
  # Write a `String#symmetric_substrings` method that returns all
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  def symmetric_substrings
    all_substrings.select { |substring| substring.is_palindrome? }
  end

  def all_substrings
    substrings = []

    (0...self.length).each do |start|
      (start...self.length).each do |ending|
        substrings << self[start..ending]
      end
    end
    substrings.uniq
  end

  def is_palindrome?
    return true if self.reverse == self && self.length > 1
    false
  end
end

# Write a method that returns the largest prime factor of a number
def prime?(num)
  (2...num).each { |i| return false if num % i == 0 }
  true
end

def largest_prime_factor(num)
  return nil if num == 1
  factors(num).select { |factor| prime?(factor) }.last
end

def factors(num)
  factors = []
  (1..num).each { |i| factors << i if num % i == 0 }
  factors
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0
    original = self.dup

    while i < self.length
      prc.call(self[i])
      i += 1
    end
    original
  end
end

class Array
  # Write an array method that returns `true` if all elements in an array
  # return `true` for the passed block and `false` otherwise
  def my_all?(&prc)
    self.each { |el| return false unless prc.call(el) }
    true
  end
end
