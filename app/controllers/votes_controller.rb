class VotesController < ApplicationController
  CHOICES = 9

  def index
    @votes = Vote.all
  end

  def new
    @votes = CHOICES.times.collect { Vote.random }
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to [:new, :vote], notice: 'Vote was successfully created.'
    else
      render action: 'new'
    end
  end

private
  def vote_params
    params.require(:vote).permit(:color, :word)
  end
end
