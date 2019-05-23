class Ingredient < ApplicationRecord
  before_destroy :ingredient_used?
  has_many :doses
  validates :name, uniqueness: true, presence: true


  private

  def ingredient_used?
    errors.add(:base, "Cannot delete booking with payments") unless Cocktail.count == 0

    errors.blank? #return false, to not destroy the element, otherwise, it will delete.
  end
end
