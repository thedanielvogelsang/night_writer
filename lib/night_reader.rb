require_relative 'braille_dictionary_hash'

class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end

class Translator_Braille_to_English
   attr_reader  :input

   def initialize(input)
     @input = input
    #  FileReader.new
    #  @input = @input.read
   end

   def prepare_for_translator
    @instance = Alphabet.new
    master_english = []
    x = []
      y = @input.split("\n") #array of strings
      y.each do |brail_line| #each string
        x << brail_line.split(//) #split into a new array[ of arrays[ of strings]] called x
      end

#x is not shrinking. how? -shrink strings? currently not doing that
 #won't stop until x is empty
        counter = 0
        until counter == y.join.length
        x.each do |string_layer| #each [array[ 'of', 'strings']] will then shift two THEN
          2.times do          #cycle to the next, retrieving only individual
            r = string_layer.shift  #braille_characters at a time
            master_english << r   #and swallowing characters only, one at a time, into
            counter +=2
          end                   #master_array
        end
       master_english
      end
      # master_english = master_english.join
      # master_english = master_english.scan(/.{6}/) #now an array of ["..00..",""] chars
      # master_english = master_english.map { |six_bit| six_bit.split(//) } #which now finally looks like the original dictionary
      # master_english = master_english.map { |braille_letter|
      #   braille_letter = @instance.braille_dictionary.key(braille_letter)}
      @input = master_english
    end
       #
      #   def swap_letters
      #   instance = Alphabet.new
      #   braille_array_master =[]
      #   @input.each { |string|
      #     y = string.split(//)
      #     y.each do |letter|
      #       if letter.downcase == letter
      #         braille_array_master << instance.braille_dictionary[letter]
      #       else
      #         x = instance.braille_dictionary[letter]
      #         braille_array_master << x[0]
      #         braille_array_master << x[1]
      #       end
      #     end
      #   }
      #   @input = braille_array_master
      #  end
end
  #chunk master_english into 6-char bits, then assign to translator.
