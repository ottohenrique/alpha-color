class VotesController < ApplicationController
  CHOICES = 6

  def index
    @votes = Vote.all
  end

  def new
    word = Vote.random_word
    @votes = CHOICES.times.collect { Vote.random(word: word) }
  end

  def create
    @vote = Vote.new(vote_params)

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
