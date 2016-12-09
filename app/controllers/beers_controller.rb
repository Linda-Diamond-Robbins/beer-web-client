class BeersController < ApplicationController
  def show
    # @beer = Beer.find_by(id: params[:id])
    @beer = Unirest.get("http://localhost:3000/beers/#{params[:id]}").body
    render 'show.html.erb'
  end

  def index
    @beers = Unirest.get("http://localhost:3000/beers").body
    render 'index.html.erb'
  end
end
