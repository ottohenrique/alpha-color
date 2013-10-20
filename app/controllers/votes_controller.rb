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
    @vote = Vote.where(vote_params).first || Vote.new(vote_params)
    @vote.total += 1

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
