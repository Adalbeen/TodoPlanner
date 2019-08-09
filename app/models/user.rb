class User < ApplicationRecord

  # Schema Information
  # Table name users
  #
  # id                   :bigint          not null, primary key
  # created_at           :timestamp
  # updated_at           :timestamp
  # email                :char
  # encrypted_password   :char
  # confirmation_token   :char
  # remember_token       :char

  validates :email, :encrypted_password, presence: true
  include Clearance::User
end
