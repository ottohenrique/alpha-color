class VotesController < ApplicationController
  CHOICES = Integer(ENV['OPTIONS'] || 9)

  def index
    @words = Vote.order(:word, :color).group(:word, :color, :total).group_by(&:word)
  end

  def new
    @word = Vote.random_word
    @votes = CHOICES.times.collect { Vote.random(word: @word) }
  end

  def create
    @vote = Vote.register(vote_params)

    if @vote.save
      redirect_to :root
    else
      render action: 'new'
    end
  end

private
  def vote_params
    params.require(:vote).permit(:color, :word)
  end
end
