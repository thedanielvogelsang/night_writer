#pseudocode #this is my change

File IO (First)

1) chceck for length ()
  def chunk_input
    separates string into 40 character chunks
    outputs arrays of 40 character max chunk array
  end

<
#start testing here
2) Create Braille Dict. Hash (Separate)

3) Translation Class
  takes each chunk array, translate by looping through following:

Take from original string(from file io), create array with .split

enum over new array with hash => value
      returns [[<braille of each letter],[braille of next letter]]
    for cap letters:
        if upcase?
          array.map.with_index do |letter, index|
            do below, for both indicies in cap letter
          end

4)create 3 empty arrays: top, mid, bottom

  for new array
def create_top_mid_bottom
    array.map do |letter_array|
      2.times
        top << letter_array.shift
      2.times
        mid << letter_array.shift
      2.times
        bottom << letter_array.shift
      end
    end



  def print_top_mid_bottom
    p top.join      #how do we get this to stop at 160 with nl
    p mid.join
    p bottom.join



end




# require 'pry'; binding.pry
