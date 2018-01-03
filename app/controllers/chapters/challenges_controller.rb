module Chapters
  class ChallengesController < ApplicationController
    before_action :set_challenge, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
      @chapter = Chapter.find(params[:chapter_id])
      @challenge = @chapter.challenges.build
    end

    def edit
    end

    def create
      @chapter = Chapter.find(params[:chapter_id])
      @challenge = @chapter.challenges.build(challenge_params)
      challengeable = @challenge.generate_challengeable(challenge_params[:challengeable_type])
      if @challenge.save && challengeable.save
        redirect_to chapter_path(@chapter)
      else
        render 'new'
      end
    end

    # PATCH/PUT /challenges/1
    # PATCH/PUT /challenges/1.json
    def update
      if @challenge.update(challenge_params)
        redirect_to chapter_path(@challenge.chapter)
      else
        render 'edit'
      end
    end

    def destroy
      chapter = @challenge.chapter
      @challenge.destroy
      redirect_to chapter_path(chapter)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def challenge_params
      params.require(:challenge).permit!
    end
  end
end