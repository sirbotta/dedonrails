module Acts
  class LocationsController < ProtectedController

    def create
      @act = Act.find(params[:act_id])
      @location = @act.locations.create(location_params)
      redirect_to act_path(@act)
    end

    def destroy
      @location = Location.find(params[:id])
      @location.destroy
      redirect_to act_path(@location.act)
    end

    def edit
      @location = Location.find(params[:id])
      @act = @location.act
    end

    def update
      @location = Location.find(params[:id])

      if @location.update(location_params)
        redirect_to @location
      else
        render 'edit'
      end
    end

    def new
      @act = Act.find(params[:act_id])
      @location = @act.locations.build
    end

    def show
      @location = Location.find(params[:id])
    end

    private
    def location_params
      params.require(:location).permit!
    end

  end
end