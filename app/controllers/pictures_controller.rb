class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only:[:edit, :update, :destroy]
  
  def index
    @pictures = Picture.order(created_at: :desc)
  end
  
  def new
    @picture = Picture.new
  end
  
  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to root_path, notice: "写真を投稿しました！"
      #NoticeMailer.sendmail_blog(@blog).deliver
    else
      render :new
    end
    
  end
  
  def edit
    
  end
  
  def update
    if @picture.update(pictures_params)
      redirect_to root_path, notice: "写真を更新しました！"
    else
      render :edit
    end
  end  
  
  def destroy
    @picture.destroy
    redirect_to root_path, notice: "写真を削除しました！"
  end
  
  private
    def pictures_params
      #params.require(:picture).permit(:picture)
      params.fetch(:picture, {}).permit(:picture)
    end
    
    def set_picture
      @picture = Picture.find(params[:id])
    end

end
