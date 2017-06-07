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
     @input = input.read.gsub("\n","")
   end

   def input
     @input
   end

   def input_split
     @input = @input.split(//)
   end

   def swap_letters
    instance = Alphabet.new
    braille_array_master =[]
    @input.each do |letter|
     if (48..57).include?(letter.ord)
       x = instance.braille_dictionary[letter]
       braille_array_master << x[0]
       braille_array_master << x[1]
     elsif letter.downcase == letter
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
          80.times do new_array << top.shift end
            new_array << "\n"
          80.times do new_array << mid.shift end
            new_array << "\n"
          80.times do new_array << bottom.shift end
            new_array << "\n"
        else
          top.length.times do new_array << top.shift end
            new_array << "\n"
          mid.length.times do new_array << mid.shift end
              new_array << "\n"
          bottom.length.times do new_array << bottom.shift end
                new_array << "\n"
        end
      end
   @input = new_array.join
   end
 end

instance = Translator.new
instance.input_split
instance.swap_letters
file_new = File.new(ARGV[1],"w+")
chars = file_new.write(instance.top_mid_bottom)

puts "Created #{ARGV[1]} with #{chars} characters."
# # # require 'pry';binding.pry
 # require 'pry'; binding.pry
