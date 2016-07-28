require 'set'
require 'byebug'
class WordChainer
  attr_reader :dictionary
  attr_accessor :current_words, :all_seen_words

  def initialize(dict_file_name = 'dictionary.txt')
    @current_words = []
    @all_seen_words = Hash.new
    @dictionary = Set.new
    File.readlines(dict_file_name).each do |line|
      @dictionary.add(line.chomp)
    end
  end


  def adjacent_words(word)
    @dictionary.to_a.select{|wrd| one_off?(wrd,word)}
  end

  def one_off?(word1, word2)
    return false if word1.length != word2.length
    idx = 0
    tally = 0

    word1.each_char do |char|
      tally +=1 unless char == word2[idx]
      idx += 1
    end
    tally == 1
  end


  def run(source, target)
    @current_words = [source]
    @all_seen_words[source] = nil
    while @current_words.length > 0
      break if @all_seen_words.has_key?(target)
      explore_current_words
    end
    build_path(target)
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |cword|
      adjacent_words(cword).each do |aword|
        next if @all_seen_words.has_key?(aword)
        new_current_words << aword
        @all_seen_words[aword] = cword

      end

    end
    @current_words = new_current_words
  end

  def build_path(target)
    results = []
    results << target
    start = target + ""

    while @all_seen_words[start] != nil
      new_start = @all_seen_words[start]
      results << new_start
      start = new_start

    end
    results
  end

end
a = WordChainer.new

system('clear')
puts
print "Enter source word, buddy: "
source = gets.chomp
puts
print "Enter target word, buddy: "
target = gets.chomp
t = Time.now
puts
puts
puts "#{a.run(source,target).join(" ==> ")}"
puts Time.now - t
puts "How's that buddy?"
