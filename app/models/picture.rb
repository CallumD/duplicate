class Picture < ActiveRecord::Base
  belongs_to :duplicate_row
  has_many :properties
end
