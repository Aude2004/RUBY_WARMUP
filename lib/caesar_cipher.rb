# Vérifie que les inputs sont valides
def valid_input?(text, shift)
  text.is_a?(String) && shift.is_a?(Integer)
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


# Vérifie si un caractère est une lettre
def letter?(char)
  char.match?(/[a-zA-Z]/)
end 

# Décale une lettre en conservant la casse et rebouclage a→z ou A→Z
def shift_letter(char, shift)
    return char unless letter?(char)  # <-- protection contre les caractères non-alphabétiques
    base = ascii_base(char)
  ((char.ord - base + shift) % 26 + base).chr
end

def caesar_cipher(text, shift)
  return nil unless valid_input?(text, shift)

  text.each_char.map do |char|
    letter?(char) ? shift_letter(char, shift) : char
  end.join
end
