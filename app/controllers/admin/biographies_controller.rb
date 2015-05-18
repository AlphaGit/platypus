class Admin::BiographiesController < Admin::BaseController
  def show
    @biography = Biography.get_single_or_default
  end

  def update
    biography = Biography.get_single_or_default
    biography.content = params[:content][:page_content][:value]
    biography.save!
    render text: ""
  end
end
