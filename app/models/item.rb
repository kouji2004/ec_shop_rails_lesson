class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :item_image
  has_many :cart_items


  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      item_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    item_image.variant(resize_to_limit: [width, height]).processed
  end

 def with_tax_price
    (price * 1.1).floor
 end

  def subtotal
      item.with_tax_price * amount
  end

end
