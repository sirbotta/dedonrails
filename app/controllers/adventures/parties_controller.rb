module Adventures
  class PartiesController < ProtectedController

    before_action :set_party, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
      @adventure = Adventure.find(params[:adventure_id])
      @party = @adventure.build_party
    end

    def edit
    end

    def update
      if @party.update(party_params)
        redirect_to @party
      else
        render 'edit'
      end
    end

    def create
      @adventure = Adventure.find(params[:adventure_id])
      @party = @adventure.build_party(party_params)
      if @party.save
        redirect_to adventure_party_path(@adventure, @party)
      else
        render 'new'
      end
    end

    def destroy
      adventure = @party.adventure
      @party.destroy
      redirect_to adventure_path(adventure)
    end


    private

    def set_party
      @party = Party.find(params[:id])
    end

    def party_params
      params.require(:party).permit(:name, :max_members)
    end
  end
end