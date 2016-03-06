class Spree::WishedProduct < ActiveRecord::Base
  belongs_to :variant
  belongs_to :wishlist

  def total
  	if(quantity.nil?)
  		quantity = 0
  	end

  	if(variant.cost_price.nil?)
  		variant.cost_price = 0
  	end
  	
    quantity.to_i * variant.cost_price
  end

  def display_total
    Spree::Money.new(total)
  end

end
