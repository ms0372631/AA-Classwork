require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

    COLORS = ["black", "white", "brown", "grey", "orange", "blue"]

    validates :color, inclusion: COLORS
    validates :birth_date, :name, :sex, :description, presence: true
    validates :sex, inclusion: ["M", "F"]

    def age
        time_ago_in_words(birth_date)
    end


end
