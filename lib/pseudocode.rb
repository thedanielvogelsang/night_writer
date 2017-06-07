l3) Translation Class
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

Reader


Master_Braille = top.shift(2x), mid.shift(2x), bottom (2x)
(^is only 80 chars in braille)

Master_Braille = Master_Braille + Master_Braille + etc.

x = master.chunk(6)

x.each do |val|

  if [.....0]
    y = [.....0] +
    new_ string << y
  else
    new_string << val
  end
end
