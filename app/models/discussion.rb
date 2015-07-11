class Discussion < ActiveRecord::Base
  validates :title,       presence: true,
                          length: { in: 2..50 }
  validates :description, presence: true,
                          length: { in: 10..200 }
  # has_many :topics


end
