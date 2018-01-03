module Acts
  class NpcsController < ProtectedController

    def create
      @act = Act.find(params[:act_id])
      @npc = @act.npcs.create(npc_params)
      redirect_to act_path(@act)
    end

    def destroy
      @npc = Npc.find(params[:id])
      @npc.destroy
      redirect_to act_path(@npc.act)
    end

    def edit
      @npc = Npc.find(params[:id])
      @act = @npc.act
    end

    def update
      @npc = Npc.find(params[:id])

      if @npc.update(npc_params)
        redirect_to @npc
      else
        render 'edit'
      end
    end

    def new
      @act = Act.find(params[:act_id])
      @npc = @act.npcs.build
    end

    def show
      @npc = Npc.find(params[:id])
    end

    private
    def npc_params
      params.require(:npc).permit!
    end

  end
end