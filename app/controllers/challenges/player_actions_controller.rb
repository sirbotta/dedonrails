module Challenges
  class PlayerActionsController < ApplicationController
    before_action :set_player_action, only: [:show, :edit, :update, :destroy]

    def index
      @actions = PlayerAction.all
    end

    def show
    end

    def new
      @action = PlayerAction.new
    end

    def edit
    end

    def create
      @challengeable = Challenge.find(params[:challenge_id]).challengeable ###  challenge 1 -> Exploration 1
      @player_action = @challengeable.player_actions.build(player_action_params)
      @player_action.character_id = @challengeable.party.find_character_by_user_id(current_user.id).id
      #@player_action.targetable = @challengeable # TODO needs to implement the real targetable

      respond_to do |format|
        if @player_action.save
          @challengeable.resolve_action(@player_action)
          format.html {redirect_to @player_action.actionable.chapter, notice: 'Action was successfully created.'}
        else
          format.html {redirect_to @player_action.actionable.chapter, notice: 'Action wasn\'t successfully created.'}
        end
      end
    end

    def update
      respond_to do |format|
        if @player_action.update(player_action_params)
          format.html {redirect_to @player_action.actionable.chapter, notice: 'Action was successfully updated.'}
        else
          format.html {redirect_to @player_action.actionable.chapter, notice: 'Action was\'t successfully updated.'}
        end
      end
    end

    def destroy
      chapter = @player_action.actionable.chapter
      @player_action.destroy
      respond_to do |format|
        format.html {redirect_to chapter, notice: 'Action was successfully destroyed.'}
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_action
      @player_action = PlayerAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_action_params
      params.require(:player_action).permit!
    end
  end
end