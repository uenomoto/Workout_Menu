class Public::HomesController < ApplicationController

  before_action :authenticate_user!, only: [:main]

  def top
  end

  def main
  end

  def guide
  end

end
