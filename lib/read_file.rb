require 'pry'
class ReadAndPrepare
  def initialize(file_as_string)
    @arg = file_as_string
  end

  def prepare_for_translator
    mini = []
    x = @arg.split(//)
    counter = 0
    until x.length == 0
      while counter <= 80
        letter = x.shift.to_s
          if letter.downcase == letter
            mini << letter
            counter += 2
          else
            mini << letter
            counter += 4
          end
        end
      argv << mini.join
      mini = []
      counter = 0
    end
    binding.pry
    print argv
  end
end

instance = ReadAndPrepare.new("HELLO YOU PESKY DEVIL YOU! HELLO YOU PESKY DEVIL!")
instance.prepare_for_translator