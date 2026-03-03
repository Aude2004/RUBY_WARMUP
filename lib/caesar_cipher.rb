def valid_input?(input)
  input.is_a?(String) && !input.empty?
end

def ascii_base(character)
  if character >= 'a' && character <= 'z'
    return 'a'.ord
  elsif character >= 'A' && character <= 'Z'
    return 'A'.ord
  else
    return nil
  end
end


def letter?(character)
  ascii_base(character) != nil
end 

def shift_letter(character, shift)
  if letter?(character)
    base = ascii_base(character)
    shifted = (character.ord - base + shift) % 26 + base
    return shifted.chr
  else
    return character
  end
end

def caesar_cipher(text, shift)
  return nil unless valid_input?(text, shift)

  text.each_char.map do |char|
    letter?(char) ? shift_letter(char, shift) : char
  end.join
end
