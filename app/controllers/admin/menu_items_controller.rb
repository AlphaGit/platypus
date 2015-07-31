class Admin::MenuItemsController < Admin::BaseController
  def index
    @menu_items = MenuItem.all
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end

  def new
    @menu_item = MenuItem.new
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def create
    @menu_item = MenuItem.new(menu_item_parameters)
    if @menu_item.save
      MenuItem.reload_all_for_display
      redirect_to @menu_item
    else
      render 'new'
    end
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    if @menu_item.update(menu_item_parameters)
      MenuItem.reload_all_for_display
      redirect_to @menu_item
    else
      render 'edit'
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    MenuItem.reload_all_for_display

    redirect_to menu_items_path
  end

  private

  def menu_item_parameters
    params.require(:menu_item).permit(:title, :link)
  end
end
