require_relative 'braille_dictionary_hash'

class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end


 class Translator
   attr_reader  :input

   def initialize
    @input = FileReader.new
    @input = input.read.gsub("\n","")   #this takes the \n off a string
   end

   def input
     @input
   end

    def chunk
    mini = []
    chunk_array = []
    x = @input.split(//)
    counter = 0
    until x.length == 0
      while counter < 80
        letter = x.shift.to_s
          if letter.downcase == letter
            mini << letter
            counter += 2
          elsif counter == 78 && letter.downcase != letter
            mini << “*”
            x.insert(0, letter.downcase)
            counter += 2
          else
            mini << letter
            counter += 4
          end
        end
      chunk_array << mini.join
      mini = []
      counter = 0
    end
    @input = chunk_array
    end



  def translate
    @input.each do |x|

    end
  end             #How does this just take each chunk of code from array from .chunk?


   def input_split
     @input = @input.split(//)
   end

   def swap_letters   #instead of using @input, pass an argument to this and replace @input in that method with that
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

      new_array = []
      until bottom == []
        if top.length >= 80
          80.times do new_array << top.shift
            new_array << mid.shift
            new_array << bottom.shift
          end
          new_array.

        else
          top.length.times do new_array << top.shift

            new_array << mid.shift

            new_array << bottom.shift

            end
        end
      end
        @input = new_array.join
   end
 end

instance = Translator.new
instance.input_split
instance.swap_letters
# file_new = File.new(ARGV[1],"w+")
# chars = file_new.write(instance.top_mid_bottom)
#
# puts "Created #{ARGV[1]} with #{chars} characters."
# # # require 'pry';binding.pry
 require 'pry'; binding.pry
