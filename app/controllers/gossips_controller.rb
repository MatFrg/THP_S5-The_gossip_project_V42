class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]
  before_action :is_author?, only: [:edit, :destroy]


	 def index
		@gossips = Gossip.all
    @like = Like.all
   end

  def show
    @display_gossip = Gossip.find(params["id"].to_i)
    @comments = Comment.all
    @comment = Comment.new('content' => params[:content], 'gossip_id' => params[:id], 'user_id' => "71")
    @comment.gossip_id = @display_gossip.id

  end

  def new
    @gossip = Gossip.new
  end


  def create
    @gossip = Gossip.new('title' => params[:title],
    										'content' => params[:content],
    										'user_id' => current_user.id)

    if @gossip.save
    	redirect_to gossips_path
    else 
    	render 'gossips/new'
    end
  end

  def edit
    @gossip = Gossip.find(params["id"].to_i)
  end


  def update
    @gossip = Gossip.find(params[:id])
    update_params = params.require(:gossip).permit(:title, :content)

    @gossip.update(update_params)


    if @gossip.update(update_params)
      redirect_to gossips_path
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params["id"].to_i)
    @gossip.destroy
    redirect_to gossips_path
  end


  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def is_author?
    unless current_user.id == Gossip.find(params[:id]).user.id
      flash[:danger] = "You can't edit someone else's gossip"
      redirect_to gossip_path(params[:id])
    end
  end
  

end
