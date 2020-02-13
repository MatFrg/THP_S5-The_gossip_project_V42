class TheGossipProjectController < ApplicationController
  def team
  end

  def contact
  end

  def welcome
  	#@user = User.find(params[:id]).first_name #cherche le user en BDD correspondant à l'id renseigné après le welcome/
		@user = params[:id] #Affiche le nom renseigné après le welcome. ex welcome/Barbenoire
		@gossips = Gossip.all#find(params["id"+1].to_i)
  end

  def gossip
  	@display_gossip = Gossip.find(params["id"].to_i)
  end

  def author
  	@author = User.find(params["id"].to_i)

  end

end
