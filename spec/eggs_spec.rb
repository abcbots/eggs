require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'eggs'

describe "Eggs" do

  it "generates keys" do
    puts 
    puts "# == Eggs: (generate a random) key"
    puts "require 'eggs'"
    puts "Eggs.key == \"#{Eggs.key}\""
    puts "Eggs.key.size == #{Eggs.key.size}"
    puts "Eggs.key(10) == \"#{Eggs.key(10)}\""
    puts "Eggs.key(10).size == #{Eggs.key(10).size}"
    puts "Eggs.key(3) == \"#{Eggs.key(3)}\""
    puts "Eggs.key(3).size == #{Eggs.key(3).size}"
  end

  it "scrambles" do
    puts
    puts "# == Eggs: scramble (text, key)"
    puts "require 'eggs'"
    puts "key = \"#{key = Eggs.key}\""
    puts "text = scrambled = \"#{text = scrambled = "dog"}\""
    puts "scrambled == text #=> #{(scrambled == text).to_s}"
    (scrambled==text).should eq(true)
    puts "scrambled = Eggs.scramble(text, key) = \"#{scrambled = Eggs.scramble(text, key)}\""
    puts "scrambled == text #=> #{(scrambled == text).to_s}"
    (scrambled==text).should eq(false)
  end

  it "unscrambles" do
    puts
    puts "# == Eggs: unscramble (text, key)"
    puts "require 'eggs'"
    puts "key == \"#{key = Eggs.key}\""
    puts "text == \"#{text = "dog"}\""
    puts "scrambled = Eggs.scramble(text, key) = \"#{scrambled = Eggs.scramble(text, key)}\""
    puts "scrambled == text #=> #{(scrambled == text).to_s}"
    (scrambled==text).should eq(false)
    puts "unscrambled = Eggs.unscramble(text, key) = \"#{unscrambled = Eggs.unscramble(scrambled, key)}\""
    puts "unscrambled == text #=> #{(unscrambled == text).to_s}"
    (unscrambled==text).should eq(true)
  end

  it "uses OpenSSL libraries to encrypt text with a key" do
    puts
    puts "# == Eggs: aes (command, text, key)"
    puts "require 'eggs'"
    puts "key == \"#{key = Eggs.key}\""
    puts "text == \"#{text = "dog"}\""
    puts "Eggs.aes(:encrypt, text, key) == \"#{scrambled = Eggs.aes(:encrypt, text, key)}\""
    puts "Src: http://stackoverflow.com/questions/8489486/encryption-and-decryption-algorithm-in-rails"
  end

end
