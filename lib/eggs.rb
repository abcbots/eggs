# == Module is reachable via module name: Eggs....
module Eggs

# == Pry for debugging
  require 'pry'

# == Eggs: scramble (text, key)
  # require 'eggs'
  # key = "8sFpMOjupOgV9STuwPqOXBBqUDEcEy"
  # text = scrambled = "dog"
  # scrambled == text #=> true
  # scrambled = Eggs.scramble(text, key) = "%ED%B6%E7%88%EC%A6g%81%17%A8%92]J%8A[%9C"
  # scrambled == text #=> false
  #
  def self.scramble(text=nil, key=nil)
    text||=text.to_s
    key||=key.to_s
    if text!="" and key!=""
      return URI.encode aes(:encrypt, key, text)
    else
      return ""
    end
  end

# == Eggs: unscramble (text, key)
  # require 'eggs'
  # key == "TxgOH3A8bqwd8L0jbcWoAA9ErKyppY"
  # text == "dog"
  # scrambled = Eggs.scramble(text, key) = "%05d%E2%A7+%FE%1D%16m%3C%B8%9F%D1%7D%5El"
  # scrambled == text #=> false
  # unscrambled = Eggs.unscramble(text, key) = "dog"
  # unscrambled == text #=> true
  #
  def self.unscramble(text=nil, key=nil)
    text||=text.to_s
    key||=key.to_s
    if text!="" and key!=""
      return aes(:decrypt, key, URI.decode(text))
    else
      return ""
    end
  end

# == Eggs: (generate a random) key
  # require 'eggs'
  # Eggs.key == "ENWi9n7n806DMU5USHE7Wbzy8iOZlc"
  # Eggs.key.size == 30
  # Eggs.key(10) == "6H3emLzzgw"
  # Eggs.key(10).size == 10
  # Eggs.key(3) == "aPY"
  # Eggs.key(3).size == 3
  # 
  def self.key(length=30)
    length=length.to_i
    s = SecureRandom.base64(length).split("")[1..length].join("").to_s
    s = s.gsub("/", SecureRandom.hex(1).split("").first.to_s)
    s = s.gsub("+", SecureRandom.hex(1).split("").first.to_s)
    return s.gsub("==", SecureRandom.hex(1).split("").first.to_s)
  end

# == Eggs: aes (command, text, key)
  # require 'eggs'
  # key == "BBCYjirFf8tqs4D3nFhukrRrtK144E"
  # text == "dog"
  # Eggs.aes(:encrypt, text, key) == "�=c�O�m2`�V�p��Y�<m:"
  # Src: http://stackoverflow.com/questions/8489486/encryption-and-decryption-algorithm-in-rails
  # 
  def self.aes(m,k=nil,t=nil)
    k||=k.to_s
    t||=t.to_s
    (aes = OpenSSL::Cipher::Cipher.new('aes-256-cbc').send(m)).key = Digest::SHA256.digest(k)
    return aes.update(t) << aes.final
  end

end
