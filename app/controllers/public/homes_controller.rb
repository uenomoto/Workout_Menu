class Public::HomesController < ApplicationController

  before_action :authenticate_user!, only: [:about]

  def top
  end

  def main
  end

  def guide
  end

end
