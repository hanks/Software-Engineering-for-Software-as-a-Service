def count_words(string)
  result_hash = {}
  result_hash.default = 0
  str = string.downcase
  words_list = str.scan(/\b[a-z]+\b/)
  words_list.each do |word|
    result_hash[word] = result_hash[word] + 1
  end
  return result_hash
end

=begin
puts count_words("A man, a plan, a canal -- Panama")
puts count_words("Doo bee doo bee doo")
=end
