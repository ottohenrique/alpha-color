class Vote < ActiveRecord::Base
  validates_presence_of :color, :word

  def self.random
    new do |vote|
      vote.word  = random_word
      vote.color = random_color
    end
  end

  def self.random_color
    format("%06x", rand(0xFFFFFF+1))
  end

  def self.random_word
    Words.sample
  end
end
