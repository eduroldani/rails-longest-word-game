require "json"
require "open-uri"

class GamesController < ApplicationController

  def new
      @letters = []
      str = "abcdefghijklmnopqrstuvwxyz"
      str =  str.split("")
      10.times { @letters.push(str[rand(26)])}
      @letters
  end



  def score
      @array = params[:array].split(",")
      @reply = params[:answer]
      url = "https://wagon-dictionary.herokuapp.com/#{@reply}"
      user_serialized = URI.open(url).read
      word = JSON.parse(user_serialized)
      @english = word["found"]
      @to_ar = @reply.split("")
      @inside = @to_ar.all?{|x| @array.include?(x)}
  end
end
