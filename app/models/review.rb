class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
  validates :content, presence: true, length: { maximum: 500 }

  scope :avg_shop, -> {self.average(:rating)}

  def blank_stars
    5 - rating.to_i
   end

   def name_state
   self.shop.state.name
  end

end
