gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/night_writer'
require_relative '../lib/braille_dictionary_hash'

class NightWriterTest < Minitest::Test

  def test_dictionary_has_letter_a
  instance = Alphabet.new
    result = instance.braille_dictionary["a"]
  expected = ['0','.','.','.','.','.']
  assert_equal(expected,result)
  end

  def test_can_access_key_from_val
    instance = Alphabet.new
    assert_equal("b", instance.braille_dictionary.key(['0','.','0','.','.','.']))

  end

  def test_input_splits_into_array
  instance = Translator.new
  assert_equal(["h","e","l","l","o"," ","w","o","r","l","d"], instance.input_split)
  end

  def test_english_to_braille
    instance = Translator.new
    instance.input_split
    result = instance.swap_letters
    assert_equal([["0", ".", "0", "0", ".", "."],
 ["0", ".", "0", ".", ".", "."],
 ["0", ".", "0", ".", "0", "."],
 ["0", ".", "0", ".", "0", "."],
 ["0", ".", ".", "0", "0", "."],
 [".", ".", ".", ".", ".", "."],
 [".", "0", "0", "0", ".", "0"],
 ["0", ".", ".", "0", "0", "."],
 ["0", ".", "0", "0", "0", "."],
 ["0", ".", "0", ".", "0", "."],
 ["0", "0", ".", "0", ".", "."]], result)
 end

 def test_for_Eng_Cap_to_Braille
   instance = Translator.new("Hello world")
   instance.input_split
   result = instance.swap_letters
   assert_equal([['.','.','.','.','.','0'],["0", ".", "0", "0", ".", "."],
["0", ".", "0", ".", ".", "."],
["0", ".", "0", ".", "0", "."],
["0", ".", "0", ".", "0", "."],
["0", ".", ".", "0", "0", "."],
[".", ".", ".", ".", ".", "."],
[".", "0", "0", "0", ".", "0"],
["0", ".", ".", "0", "0", "."],
["0", ".", "0", "0", "0", "."],
["0", ".", "0", ".", "0", "."],
["0", "0", ".", "0", ".", "."]], result)
end

  def test_for_proper_spacing
    instance = Translator.new(" ")
    instance.input_split
    x = instance.swap_letters
    assert_equal([[".", ".", ".", ".", ".", "."]], x)
  end

  def test_top_mid_bottom
    instance = Translator.new("Hello World")
    instance.input_split
    instance.swap_letters
    print_out = instance.top_mid_bottom
    assert_equal(22, print_out.length)
  end
end
