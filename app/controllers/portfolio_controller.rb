class PortfolioController < ApplicationController
  def index
    @work_pieces = WorkPiece.order(:position)
  end

  def show
    @work_piece = WorkPiece.find(params[:id])
  end
end
