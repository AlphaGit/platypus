class BiographyController < ApplicationController
  def index
    @biography = Biography.get_single_or_default
  end
end
