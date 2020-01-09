class ProductsController < ApplicationController
  include MypageHelper
  before_action :move_to_login, only: [:sell, :pay, :buy, :destroy]
  
  before_action :set_product, only: [:pay, :show, :edit, :update, :buy, :destroy]
  before_action :set_delivery, only: [:sell, :edit]
  before_action :set_category, only: [:sell, :create, :edit]

  def sell
    @product = Product.new
    @product.images.build
    @delivery = Delivery.all.order("id ASC").limit(2) # deliveryの親
  end

#ここからAjax通信用
  ##delivery
  def delivery_children
    @delivery_children = Delivery.find(params[:productdelivery]).children
  end

  ##category
  def category_children
    @category_children = Category.find(params[:productcategory]).children 
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:productcategory]).children
  end
#ここまでAjax通信用 

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "出品しました"
      redirect_to root_path
    else
      flash[:alert] = "出品失敗しました"
      redirect_to controller: :products, action: :sell
    end
  end
 
  def done
  end
  
  def pay
    @image = @product.images
    @postage = @product.delivery.responsibility.include?("出品者負担") ? "送料込み" : "着払い"
    @havepoint = @product.user.point == nil ? "ポイントがありません" : @product.user.point

    if current_user.card != nil
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      card = current_user.card
      customer = Payjp::Customer.retrieve(card.customer_id)
      @payjp_card = customer.cards.retrieve(card.card_id)
      @icon = card_icon(@payjp_card)
    end
  end

  def show
    @images = @product.images
    @seller = @product.user
    @category = @product.category
    @delivery = @product.delivery
    @postage = @delivery.responsibility.include?("出品者負担") ? "送料込み" : "着払い"
    @back_product = Product.where('id < ?', @product.id).order("id DESC").first
    @next_product = Product.where('id > ?', @product.id).first
    @seller_other_products = Product.where(user_id: @seller.id).order("id DESC").limit(6).where.not(id: @product.id).where.not(selling_status: "売却済")
    @category_other_products = Product.where(category_id: @category.id).order("id DESC").limit(6).where.not(id: @product.id).where.not(selling_status: "売却済")
    @message = Message.new
    @messages = @product.messages
  end

  def edit
    @product.images.build

    grand_num = @product.category_id
    parent_num = Category.find(grand_num).parent.parent.id
    children_num = Category.find(grand_num).parent.id

    delivery_num = @product.delivery.ancestry

    @category_children = Category.where(ancestry: parent_num)
    @categroy_grand = Category.where(ancestry: "#{parent_num}/#{children_num}")
    @delivery_children = Delivery.where(ancestry: delivery_num)
  end

  def update
    
    if @product.update(product_params)
      flash[:notice] = "変更しました。"
      redirect_to product_path(@product.id)
    else
      flash[:alert] = "変更失敗しました。"
      redirect_to edit_product_path(@product.id)
    end

  end

  def buy
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    if current_user.card != nil
      card = current_user.card
      charge = Payjp::Charge.create(
        amount:   @product.price,
        customer: card.customer_id,
        currency: 'jpy'
      )
      @product.update(selling_status: "売却済")
      flash[:notice] = "商品を購入しました。"
      redirect_to product_path(@product.id)
    else
      flash[:alert] = "商品の購入に失敗しました"
      redirect_to product_path(@product.id)
    end
  end

  def destroy

    if @product.user_id == current_user.id
      @product.destroy
      flash[:notice] = "削除しました!"
      redirect_to root_path
    else @product.destroy
      flash[:alert] = "削除できませんでした！"
      redirect_to product_path(@product.id)
    end

  end

  def search
    @products = Product.product_like(like_search_params[:keyword])
  end

private

  def product_params
    params.require(:product).permit(
      :name,
      :information,
      :price,
      :area,
      :status,
      :sending_days,
      :profit,
      :selling_status,
      :category_id,
      :delivery_id,
      :brand_id,
      images_attributes: [:image, :id, :_destroy]
    ).merge(user_id: current_user.id)
  end

  def product_update_params
    params.require(:product).permit(
      :name,
      :information,
      :price,
      :area,
      :status,
      :sending_days,
      :profit,
      :selling_status,
      :category_id,
      :delivery_id,
      :brand_id,
      images_attributes: [:image, :id, :_destroy]
    ).merge(user_id: current_user.id)
  end

  def set_category
    @category = Category.order("id ASC").limit(4)
  end
    
  def set_product
    @product = Product.find_by_id(params[:id])
    redirect_to root_path if @product.nil?
  end

  def set_delivery
    @delivery = Delivery.order("id ASC").limit(2)
  end

  def like_search_params
    params.fetch(:product_like, {}).permit(:keyword)
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

end
