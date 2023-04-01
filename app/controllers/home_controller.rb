# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def scrape
    url = params[:url]
    response = RestaurantsScraper.process(url)
    if response[:status] == :completed && response[:error].nil?
      flash[:notice] = 'Successfully scraped url'
    else
      flash[:alert] = response[:error]
    end
    redirect_to root_path
  rescue StandardError => e
    flash[:alert] = "Error: #{e}"
    redirect_to root_path
  end
end
