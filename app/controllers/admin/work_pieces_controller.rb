class Admin::WorkPiecesController < Admin::BaseController
  def index
    @work_pieces = WorkPiece.order(:position)
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

  def sort
    @work_pieces = WorkPiece.all
    # TODO prevent SELECT N+1
    @work_pieces.each do |w|
      w.position = params['work_piece'].index(w.id.to_s) + 1
      w.save
    end

    render :nothing => true
  end

  def destroy
    @work_piece = WorkPiece.find(params[:id])
    @work_piece.destroy

    redirect_to work_pieces_path
  end

  def change_visibility
    @work_piece = WorkPiece.find(params[:work_piece_id])
    @work_piece.toggle!(:is_visible)
    redirect_to work_pieces_path
  end

  private

  def work_piece_parameters
    params.require(:work_piece).permit(:title, :description, :image)
  end
end
