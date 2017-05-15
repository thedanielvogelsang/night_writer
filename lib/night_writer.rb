#pseudocode
require_relative 'braille_dictionary_hash'

class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end


 class Translator
   attr_reader  :input

   def initialize(input = nil)
     @input = FileReader.new
     @input = input
   end

   def input_split
     @input = @input.split(//)
   end

   def swap_letters
    instance = Alphabet.new
    braille_array_master =[]
    @input.each do |letter|
      if letter.downcase == letter
        braille_array_master << instance.braille_dictionary[letter]
      else
        x = instance.braille_dictionary[letter]
        braille_array_master << x[0]
        braille_array_master << x[1]
      end
    end
    @input = braille_array_master
   end

   def top_mid_bottom

     top = []
     mid = []
     bottom = []
     @input.each do |sub_array|
        top << sub_array[0]
        top << sub_array[1]
        mid << sub_array[2]
        mid << sub_array[3]
        bottom << sub_array[4]
        bottom << sub_array[5]
      end
     puts top.join
     puts mid.join
     puts bottom.join
   end
 end

# instance = Translator.new
# instance.input_split
# instance.swap_letters
# instance.top_mid_bottom
# require 'pry'; binding.pry

# puts ARGV.inspect
require 'pry';binding.pry
