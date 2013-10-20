class VotesController < ApplicationController
  before_action :set_vote, only: [:show]

  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vote }
      else
        format.html { render action: 'new' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

private
  def vote_params
    params.require(:vote).permit(:word_id, :coloer_id)
  end
end
