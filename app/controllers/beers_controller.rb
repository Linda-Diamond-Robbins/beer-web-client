class BeersController < ApplicationController
  def index
    # @beers = Beer.all
    @beers = Unirest.get(
      "http://localhost:3000/api/v1/beers",
      headers: { 'Authorization' => "Token token=#{ENV['API_KEY']}", 'X-User-Email' => ENV['API_EMail']}
      ).body
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    @beer = Unirest.post(
      "http://localhost:3000/api/v1/beers",
      parameters: {
        name: params[:name],
        style: params[:style],
        alcohol: params[:alcohol],
        ibu: params[:ibu]
      }
    ).body
    redirect_to "/beers/#{@beer["id"]}"
  end


  def show
    # @beer = Beer.find_by(id: params[:id])
    @beer = Unirest.get("http://localhost:3000/api/v1/beers/#{params[:id]}").body
    render 'show.html.erb'
  end

  def edit
    @beer = Unirest.get("http://localhost:3000/api/v1/beers/#{params[:id]}").body
    render 'edit.html.erb'
  end

  def update
    @beer = Unirest.patch(
      "http://localhost:3000/api/v1/beers/#{params[:id]}",
      parameters: {
        name: params[:form_name],
        style: params[:style],
        alcohol: params[:alcohol],
        ibu: params[:ibu]
      }
    ).body
    redirect_to "/beers/#{@beer['id']}"
  end

  def destroy
    message = Unirest.delete("http://localhost:3000/api/v1/beers/#{params[:id]}").body
    redirect_to "/beers"
  end
end
Contact GitHub API Training Shop Blog About
