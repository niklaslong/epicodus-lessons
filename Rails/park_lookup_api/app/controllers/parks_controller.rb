class ParksController < ApplicationController
   include Response
  def index
    parks = Park.all.page params[:page]
    json_response(parks)
  end

  def show 
    park = Park.find(params[:id])
    json_response(park)
  end

  def random
    json_response(Park.random_park)
  end

  def search
    park = Park.search_parks(params[:name])
    if park.empty?
      json_response({message: "There are no results for your search"})
    else
      json_response(park)
    end
  end

  def create
    park = Park.create!(park_params)
    json_response(park, :created)
  end

  def update
    if park_params.empty?
      json_response(message: "You left the name parameter blank, you need to specify a name parameter if you want me to do something. Otherwise I'll just sit around and do nothing ;-)")
    else
      park = Park.find(params[:id])
      if park.update!(park_params)
        json_response(message: "song was updated")
      end
    end
  end

  def destroy
    park = Park.find(params[:id])
    if park.destroy!
      json_response(message: "song was deleted")
    end
  end

  private

  def park_params
    params.permit(:name)
  end
end
