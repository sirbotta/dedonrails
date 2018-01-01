module Adventures
  class ActsController < ProtectedController

    def show
      @act = Act.find(params[:id])
    end

    def new
      @adventure = Adventure.find(params[:adventure_id])
      @act = @adventure.acts.build
    end

    def edit
      @act = Act.find(params[:id])
    end

    def update
      @act = Act.find(params[:id])

      if @act.update(act_params)
        redirect_to @act
      else
        render 'edit'
      end
    end

    def create
      @adventure = Adventure.find(params[:adventure_id])
      @act = @adventure.acts.create(act_params)
      if @act.save
        redirect_to adventure_act_path(@act.adventure, @act)
      else
        render 'new'
      end
    end

    def destroy
      @act = Act.find(params[:id])
      @act.destroy

      redirect_to acts_path
    end


    private
    def act_params
      params.require(:act).permit(:title, :text)
    end
  end
end
