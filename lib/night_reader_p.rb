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

     def split_at_new_line
      @instance = Alphabet.new
      x = []
        y = @input.split("\n") #array of strings divided at each line(top,mid,bot)
        y.each do |brail_line| #each string
          x << brail_line.split(//) #split into a new array[ of strings, separated]] called x
        end
        @input = x
      end

      def chunk_lines
        master_english = []
        until @input.length == 0
          temporary = []
          3.times do
            temporary << @input.shift
          end
          master_english << temporary
          temporary = []
        end
          @input = master_english
      end

      def prepare_for_translator
        temporary = []
        @input.each { |sub_array|
          x = @input.length
          top = sub_array[0]
          counter = 0
          until counter == x
            t = top.length
            t = t / 2
            t.times do
              sub_array[0..2].each do |array_of_braille|
              2.times do
                r = array_of_braille.shift
                temporary << r
                end
              end
            end
            3.times do sub_array.shift end
            counter += 1
           end
        }
        @input = temporary
        temporary
       end

       def join_em_up
         master_english = @input.join
         master_english = master_english.scan(/.{6}/) #now an array of [“..00..“,”“] chars
         master_english = master_english.map { |six_bit| six_bit.split(//) } #which now finally looks like the original dictionary
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


end

instance = BrailleReader.new
# instance.ready_braille
# file_new = File.new(ARGV[1],"w+")
# chars = file_new.write(instance.translate_to_english)
#
# puts "Created #{ARGV[1]} with #{chars} characters."

require 'pry'; binding.pry
