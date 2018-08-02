# O(n!) - Factorial
def first_anagram?(str1,str2)
  arr = str1.chars.permutation.to_a
  arr.include?(str2.chars)
end

# O(n^2) - Quadratic
def second_anagram?(str1,str2)
  str2_chars = str2.chars
  str1.each_char do |chr|
    idx = str2_chars.find_index(chr)
    str2_chars.delete_at(idx) if idx
  end
  str2_chars.empty?
end
# O(nlogn) - linearithmic
def third_anagram?(str1,str2)
  str1.chars.sort == str2.chars.sort
end

# O(n) - Linear, constant space
def fourth_anagram?(str1,str2)
  counter = Hash.new(0)
  str1.each_char { |chr| counter[chr] += 1 }
  str2.each_char { |chr| counter[chr] -= 1 }
  counter.all? { |k, v| v == 0 }
end
