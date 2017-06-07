gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/night_reader'


#tested before File IO implementation
#previous input for testing:
#input: "Hello, World"

class BrailleReaderTest < Minitest::Test
      def test_braille_has_input
        instance = BrailleReader.new
        result = instance.input
        assert_equal , result
      end

      def test_splits_braille_correctly_at_line
        skip
        instance = BrailleReader.new
        result = instance.split_at_new_line
        expected = [["H","e","l","l","o",",", "W","o","r","l","d"]]

        assert_equal result,
      end

      def test_reorders_braille_into_english_read_order

      skip
      end

      def test_joins_into_sub_arrays_readable_by_dict
        test
      end

      def test_translates_to_english
        test
      end

      def test_can_account_for_capitals
        test
      end

      def test_can_account_for_numbers
        skip
      end


end
