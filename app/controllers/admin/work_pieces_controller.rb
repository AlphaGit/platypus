class Admin::WorkPiecesController < ApplicationController
  def index
    @work_pieces = WorkPiece.all
  end

  def show
    @work_piece = WorkPiece.find(params[:id])
  end

  def new
    @work_piece = WorkPiece.new
  end

  def edit
    @work_piece = WorkPiece.find(params[:id])
  end

  def create
    @work_piece = WorkPiece.new(work_piece_parameters)
    if @work_piece.save
      redirect_to @work_piece
    else
      render 'new'
    end
  end

  def update
    @work_piece = WorkPiece.find(params[:id])
    if @work_piece.update(work_piece_parameters)
      redirect_to @work_piece
    else
      render 'edit'
    end
  end

  def destroy
    @work_piece = WorkPiece.find(params[:id])
    @work_piece.destroy

    redirect_to work_pieces_path
  end

  private

  def work_piece_parameters
    params.require(:work_piece).permit(:title, :description, :image)
  end
end
