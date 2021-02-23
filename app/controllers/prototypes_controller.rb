class PrototypesController < ApplicationController
  # before_action :find_user
  before_action :find_prototype, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show]
    def index
      @prototypes = Prototype.includes(:user).order("created_at DESC")
    end
  
    def new
      @prototype = Prototype.new
    end
  
    def create
      @prototype = Prototype.create(prototypes_param)
      if @prototype.save
        redirect_to root_path
      else
        render "/prototypes/new"
      end
    end
  
    def edit 
    end
  
    def update
      @prototype.update(prototypes_param)
      if @prototype.save
        redirect_to prototype_path(@prototype.id)
      else
        render :edit
      end
    end  
  
    def show
      @comment = Comment.new
      @comments = @prototype.comments.includes(:user)
    end
  
    def destroy
      @prototype.destroy
      redirect_to root_path
    end
  
  private

    def find_prototype
      @prototype = Prototype.find(params[:id])
    end
    
    def prototypes_param
      params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(
        user_id: current_user.id)
    end
end
