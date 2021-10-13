class Album < ApplicationRecord
    validates :title, :year, :studio, presence: true,
  
    belong_to :band,
        primary_key: :id,
        foreign_key: :band_id,
        class_name: :Band




end
