module Acts
  class RumorsController < ProtectedController

    def create
      @act = Act.find(params[:act_id])
      @rumor = @act.rumors.create(rumor_params)
      redirect_to act_path(@act)
    end

    def destroy
      @rumor = Rumor.find(params[:id])
      @rumor.destroy
      redirect_to act_path(@rumor.act)
    end

    def edit
      @rumor = Rumor.find(params[:id])
      @act = @rumor.act
    end

    def update
      @rumor = Rumor.find(params[:id])

      if @rumor.update(rumor_params)
        redirect_to @rumor
      else
        render 'edit'
      end
    end

    def new
      @act = Act.find(params[:act_id])
      @rumor = @act.rumors.build
    end

    def show
      @rumor = Rumor.find(params[:id])
    end

    private
    def rumor_params
      params.require(:rumor).permit!
    end

  end
end