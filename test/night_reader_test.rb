gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/night_reader_p'


class BrailleReaderTest < Minitest::Test
      def test_braille_has_input
        instance = BrailleReader.new
        result = instance.input
        assert_equal ARGV[0], result
      end

      def test_can_store_braille_arrays
        skip
      end

      def test_has
      skip
      end



end
