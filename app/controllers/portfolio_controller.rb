class PortfolioController < ApplicationController
  def index
    @work_pieces = WorkPiece.all
  end

  def show
    @work_piece = WorkPiece.find(params[:id])
  end
end
