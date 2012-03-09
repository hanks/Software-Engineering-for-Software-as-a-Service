#question a
class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  @@dollars = 0
  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      @@dollars = self * @@currencies[singular_currency]
    elsif method_id.to_s == "in"
      curr = args[0].to_s.gsub(/s$/, '')
      @@dollars / @@currencies[curr]
    else
      super
    end
  end
end

#puts 1.dollar.in(:rupees)
#puts 10.rupees.in(:euro)

#question b
def palindrome?(string)
  result = false
  str = string.to_s.downcase
  re = /[^a-z0-9]/
  str = str.gsub(re, "")
  str_reverse = str.reverse
  if str_reverse == str
    result = true
  end
  return result
end

class String
  def method_missing(method_id)
     if method_id.to_s == "palindrome?"
       return palindrome?(self)
     else
       super
     end
  end
end

#question c
def array_palindrome?(ary)
  ary_reverse = ary.reverse
  ary_reverse == ary
end

module Enumerable
  def method_missing(method_id)
     if method_id.to_s == "palindrome?"
       return array_palindrome?(self.to_a)
     else
       super
     end
  end
end
#p [1,2,3,2,1].palindrome?
#p [1..4].palindrome?

