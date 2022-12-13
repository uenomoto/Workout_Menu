class Public::SearchesController < ApplicationController


  def search
    @model = params[:model]
    @word = params[:word]
    @method = params[:method]

    if @model == "User"
      @records = User.search_for(@word, @method)
    end
  end

end
