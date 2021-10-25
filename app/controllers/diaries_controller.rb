class DiariesController < ApplicationController
  def index
    @diary = Diary.new
    @diaries = Diary.all
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      flash[:notice]='successfully'
      redirect_to "/diaries/#{@diary.id}"
    else
      @diaries = Diary.all
      render "index"
    end
   

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      flash[:notice]='successfully'
      redirect_to "/diaries/#{@diary.id}"
    else
      render "edit"
    end
  end

  def destroy
    diary = Diary.find(params[:id])
    diary.destroy
    redirect_to '/diaries'
  end

  private

  def diary_params
    params.require(:diary).permit(:title, :body)
  end
    

end
