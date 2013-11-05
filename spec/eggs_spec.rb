require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'eggs'

describe "Eggs" do
  it "generates a key" do
    puts Eggs.key
  end
end
