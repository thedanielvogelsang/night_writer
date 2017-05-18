require_relative 'braille_dictionary_hash'

class FileReader
  def read
    filename = ARGV[0]
    File.read(filename)
  end
end

class BrailleReader
attr_reader :input

  def initialize
    @input = FileReader.new
    @input = input.read
  end

  def ready_braille
    # instance = Alphabet.
    master_english = []
    x = []
      y = @input.split("\n") #array of strings
      y.each do |brail_line| #each string
        x << brail_line.split(//) #split into a new array[ of arrays[ of strings]] called x
      end
        counter = 0
        until counter == y.join.length
        x.each do |string_layer| #each [array[ 'of', 'strings']] will then shift two THEN
          2.times do          #cycle to the next, retrieving only individual
            r = string_layer.shift  #braille_characters at a time
            master_english << r   #and swallowing characters only, one at a time, into
            counter +=2
          end                   #master_array
        end
      # master_english
      end


      #before this is Daniels code
      master_english = @master_english.join
      master_english = master_english.scan(/.{6}/) #now an array of ["..00..",""] chars
      master_english = master_english.map { |six_bit| six_bit.split(//) } #which now finally looks like the original dictionary
      # master_english = master_english.map { |braille_letter|
      #   braille_letter = instance.braille_dictionary.key(braille_letter)}
      @input = master_english

  end

# this is

  def translate_to_english
    instance = Alphabet.new
    english_trans = []
      @input.map.with_index do |x, i|
        if x == ['.','.','.','.','.','0']
          x = @input.at(i+1)
          @input.delete_at(i)
          letter = instance.braille_dictionary.key(x)
          english_trans << letter.upcase
        else
          english_trans << instance.braille_dictionary.key(x)
        end
      end
    @input = english_trans
    @input = @input.join
  end

        #how to turn following into loop, to avoid writing top[0..79], [80.120], etc.
        # array_to_print = top[0..79]     #flow control if > 80?
        # @input = array_to_print.join + "\n"
        # array_to_print = mid[0..79]
        # @input << array_to_print.join + "\n"
        # array_to_print = bottom[0..79]
        # @input << array_to_print.join + "\n"
        #
        # array_to_print = top[80..159]     #flow control if > 80?
        # @input << array_to_print.join + "\n"
        # array_to_print = mid[80..159]
        # @input << array_to_print.join + "\n"
        # array_to_print = bottom[80..159]
        # @input << array_to_print.join + "\n"
        # @input

end

instance = BrailleReader.new
instance.ready_braille
file_new = File.new(ARGV[1],"w+")
chars = file_new.write(instance.translate_to_english)

puts "Created #{ARGV[1]} with #{chars} characters."

require 'pry'; binding.pry
