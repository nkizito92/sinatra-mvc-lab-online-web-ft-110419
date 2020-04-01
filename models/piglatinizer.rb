class PigLatinizer

  def piglatinize(in_str)
    if in_str.split(" ").length == 1 
       piglat_word(in_str)
    else
       piglat_sentence(in_str)
    end 
  end

  private

  def consonant?(char)
    !char.match(/[aAeEiIoOuU]/)
  end

  def piglat_word(word)
    
    if !consonant?(word[0])
      word = word + "w"
    
    elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
      word = word.slice(3..-1) + word.slice(0,3)
    
    elsif consonant?(word[0]) && consonant?(word[1])
      word = word.slice(2..-1) + word.slice(0,2)
    
    else
      word = word.slice(1..-1) + word.slice(0)
    end
    word << "ay"
  end

  def piglat_sentence(sentence)
    sentence.split.collect { |word| piglat_word(word) }.join(" ")
  end


end 