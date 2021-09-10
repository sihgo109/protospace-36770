class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_prototype, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  #before_action :move_to_index, except: [:index, :show]
  #before_action :set_prototype, only: [:edit, :show]

  def index
    @prototypes = Prototype.includes(:user)
    #@prototypes = Prototype.all.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
      #redirect_to root_path(@prototype)
    else
      render :new
      #@prototype = Prototype.includes(:user)
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to root_path
    #prototype = Prototype.find(params[:id])
    # if prototype.update(prototype_params)
    #   redirect_to prototype_path
    else
      render :edit
      #redirect_to edit_prototype_path
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path
    # prototype = Prototype.find(params[:id])
    # if prototype.destroy
    else
      redirect_to root_path
    end
  end

  private

 def prototype_params
   params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    #params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
 end

 def set_prototype
  @prototype = Prototype.find(params[:id])
 end

 def move_to_index
  redirect_to root_path unless current_user == @prototype.user
   #  unless user_signed_in?
   #     redirect_to action: :index
   #   end
 end
end