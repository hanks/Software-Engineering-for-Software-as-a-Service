def palindrome?(string)
  result = false
  str = string.downcase
  #puts "str="+str
  re = /[^a-z]/
  str = str.gsub(re, "")
  #puts "new str=" + str
  str_reverse = str.reverse
  #puts "str_reverse="+str_reverse
  if str_reverse == str
    result = true
  end
  return result
end

=begin
puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")
=end
