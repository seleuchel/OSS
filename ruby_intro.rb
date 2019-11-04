# When done, submit this entire file to the autograder.

# Part 1

def sum arr
    sum = 0
    arr.each { |x|
      sum += x
    }
  sum
end

def max_2_sum arr
  max1 = 0
  max2 = 0
  
  if arr.empty?
    return 0
  elsif arr.length == 1
    return arr[0]
  else
    arr.sort!
    max1 = arr[arr.length-1]
    max2 = arr[arr.length-2]
    return max1 + max2
  end
end


def sum_to_n? arr, n
  arr.each{
    |i|
    arr.each{
      |j|
      if i != j
        if i + j == n
          return true
        end
      end
    }
  }
  return false
end



# Part 2

def hello(name)
  return 'Hello, ' + name
end

def starts_with_consonant? s
  # YOUR CODE HERE
  vowel = ['a','e','i','o','u','A','E','I','O','U']
  if s.empty?
    return false 
  else
      vowel.each{
        |x|
          if !s.split('')[0].match(/[A-Za-z]/)
            return false
          elsif x == s.split('')[0]
            return false
          end
      }
      return true
    end
end

def binary_multiple_of_4? s
  if s.match(/[a-zA-Z]/) != nil
    return false
  else
    if s.match(/[0-1]/) 
      q = s.to_i(2)
      if q % 4 == 0
        return true
      else
        return false
      end
    else
      return false
    end
  end
end

# Part 3

class BookInStock
  def initialize(isbn,price)
    raise ArgumentError.new if isbn.empty?
    raise ArgumentError.new if price <= 0
    @isbn = isbn
    @price = price.to_f.round(2)
  end
  
  def isbn
    return @isbn
  end
  
  def price
    return @price
  end
  
  def isbn= ni
    @isbn = ni
  end
  def price= np
    @price = np
  end
  
  def price_as_string
    return '$' + '%.2f' % @price
  end
end
