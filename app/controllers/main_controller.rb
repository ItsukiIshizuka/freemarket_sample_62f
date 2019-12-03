class MainController < ApplicationController
  def index
    @products = Product.all.order("id DESC")
    # @images = Image.all
    @women = []
    @men = []
    @parents = Category.all.limit(13)
    @home_appliances = []
    @toys = []

    @products.each do |product|
      case product.category.parent.parent.name
      when "レディース"
        @women << product
      when "メンズ"
        @men << product
      when "家電・スマホ・カメラ"
        @home_appliances << product
      when "おもちゃ・ホビー・グッズ"
        @toys << product
      end
    end

  end
end
