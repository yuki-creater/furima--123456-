
  def index
    return redirect_to root_path if current_user.id == select_item.user_id || select_item.item_transaction != nil

    @item_transaction = PayForm.new
  end