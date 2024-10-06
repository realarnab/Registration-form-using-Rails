class Profile < ApplicationRecord
  include ActiveModel::Validations
  validates_with ProfileValidator
end
