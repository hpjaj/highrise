class DictionarySequencer

  def initialize
    @sequence_pairings = []
  end

  def sequence_dictionary(text_file)
    dictionary = File.read(text_file).split
    dictionary.each do |word|
      word_length = word.length
      range_of_indeces = word_length - 4
      if word_length >= 4
        (0..range_of_indeces).each do |index|
          sequence = word.slice(index, 4)
          build_array_of_pairs(word, sequence)
        end
      end
      puts word  # this is to watch the progress in the terminal
    end

    output_results('sequences.txt', 0)
    output_results('words.txt', 1)
  end

  private

  def build_array_of_pairs(word, sequence)
    if ( duplicate_pairs_index = @sequence_pairings.find_index { |pair| pair[0] == sequence } )
      @sequence_pairings.delete_at(duplicate_pairs_index)
    else
      @sequence_pairings << [sequence, word]
    end
  end

  def output_results(file, index)
    File.open(file, 'w') do |file|
      @sequence_pairings.each do |pair|
        file.puts pair[index]
      end
    end
  end

end