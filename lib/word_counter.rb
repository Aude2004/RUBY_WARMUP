def word_counter(corpus, dictionary)
  return {} unless corpus.is_a?(String)
  return {} unless dictionary.is_a?(Array)

  result = Hash.new(0)

  words = corpus.downcase.split(/\W+/)

  words.each do |word|
    dictionary.each do |dict_word|
      if word.include?(dict_word.downcase)
        result[dict_word] += 1
      end
    end
  end

  result
end
