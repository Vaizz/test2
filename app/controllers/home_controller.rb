class HomeController < ApplicationController

  require 'open-uri'
  
  def index
  end

  def show
    source = 'http://time.jsontest.com/'
    @value = JSON.load ( open (source) )
    render json: @value
  end

end
