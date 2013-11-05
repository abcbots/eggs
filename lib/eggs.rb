module Eggs

  require 'action_view'

#== Eggs: Scramble
# Eggs.scramble("dog", "dj4ki6bs9edh4jdu8mgbg3fi7s63eg") #=> ""
# Eggs.scramble("cat", "dj4ki6bs9edh4jdu8mgbg3fi7s63eg") #=> ""
# Eggs.scramble("bird", "dj4ki6bs9edh4jdu8mgbg3fi7s63eg") #=> ""
  def self.scramble(text="", key=nil)
    if text.present?
      #url_encode aes(:encrypt, key, text)
      URI.encode(aes(:encrypt, key, text.to_s))
    else
      ""
    end
  end

#== Eggs: Unscramble
# Eggs.unscramble("...", "dj4ki6bs9edh4jdu8mgbg3fi7s63eg") #=> "dog"
# Eggs.unscramble("...", "dj4ki6bs9edh4jdu8mgbg3fi7s63eg") #=> "cat"
# Eggs.unscramble("...", "dj4ki6bs9edh4jdu8mgbg3fi7s63eg") #=> "bird"
  def self.unscramble(text="", key=nil)
    if ((key=key.to_s).present? and (text=text.to_s).present?)
      aes(:decrypt, key, URI.decode(text))
    else
      ""
    end
  end

#== Eggs: (Generate Random) Key
# Eggs.key #=> "dj4ki6bs9edh4jdu8mgbg3fi7s63eg"
# Eggs.key(10) #=> "i6bs9edh4j"
# Eggs.key(3) #=> "jd3"
  def self.key(length=30)
    length=length.to_i
    s = SecureRandom.base64(length).to_s
    s = s.gsub("/", SecureRandom.hex(1).first.to_s)
    s = s.gsub("+", SecureRandom.hex(1).first.to_s)
    return s.gsub("==", SecureRandom.hex(1).first.to_s)
  end

end
