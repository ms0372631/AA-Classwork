class Todo < ApplicationRecord
  validates :done, inclusion: {in: [true, false]}
end
