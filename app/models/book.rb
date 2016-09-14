class Book < ActiveRecord::Base
  has_one :author, dependent: :destroy
  belongs_to :user
  validates_presence_of :name
  accepts_nested_attributes_for :author
end