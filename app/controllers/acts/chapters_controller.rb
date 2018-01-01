module Acts
  class ChaptersController < ProtectedController

    def create
      @act = Act.find(params[:act_id])
      @chapter = @act.chapters.create(chapter_params)
      redirect_to act_path(@act)
    end

    def destroy
      @chapter = Chapter.find(params[:id])
      @chapter.destroy
      redirect_to act_path(@chapter.act)
    end

    def edit
      @chapter = Chapter.find(params[:id])
      @act = @chapter.act
    end

    def update
      @chapter = Chapter.find(params[:id])

      if @chapter.update(chapter_params)
        redirect_to @chapter
      else
        render 'edit'
      end
    end

    def new
      @act = Act.find(params[:act_id])
      @chapter = @act.chapters.build
    end

    def show
      @chapter = Chapter.find(params[:id])
    end

    private
    def chapter_params
      params.require(:chapter).permit(:title, :text)
    end

  end
end
