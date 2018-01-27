class Vote < ApplicationRecord
  belongs_to :staff
  belongs_to :voted_staff
end
