require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'pry'
require 'eggs'

describe "Eggs" do
  it "generates a key" do
    binding.pry
    puts Eggs.key
  end
end
