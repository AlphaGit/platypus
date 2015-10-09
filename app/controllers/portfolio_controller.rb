class PortfolioController < ApplicationController
  def index
    @work_pieces = WorkPiece.where(:is_visible => true).order(:position)
  end

  def show
    @work_piece = WorkPiece.find(params[:id])
    head :forbidden unless @work_piece.is_visible
  end
end
