class ActsController < ApplicationController

  def index
    @acts = Act.all.includes(:chapters)
  end

  def show
    @act = Act.find(params[:id])
  end

  def new
    @act = Act.new
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
    @act = Act.new(act_params)

    if @act.save
      redirect_to @act
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
