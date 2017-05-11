class ClientController < ApplicationController
  layout false
  layout 'application', :except => [:home, :about]
  skip_before_action :authenticate_user!, only: [:home, :about]

  def index
  end

  def home

  end

  def about

  end
end
