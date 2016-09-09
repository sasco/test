class Book < ActiveRecord::Base
  has_one :author, dependent: :destroy
  validates_presence_of :name
  accepts_nested_attributes_for :author
end