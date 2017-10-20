class Category < ActiveRecord::Base

  # gem Friendly Id
  include FriendlyId
  friendly_id :description, use: :slugged

  # Associations
  has_many :ads

  validates_presence_of :description

  # scopo para os anuncios por ordem de descrição
  scope  :order_by_description, -> { order(:description) }

end
