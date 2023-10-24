class User < ApplicationRecord
  devise :database_authenticatable, :validatable, :registerable

  belongs_to :company

  def name
    email.split('@').first.capitalize
  end

  delegate :name,
           to: :company,
           prefix: true,
           allow_nil: true
end
