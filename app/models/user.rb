# frozen_string_literal: true

class User < ApplicationRecord
  USERNAME_MAX_LENGTH = 16
  USERNAME_MIN_LENGTH = 4

  PASSWORD_MAX_LENGTH = 16
  PASSWORD_MIN_LENGTH = 8

  has_secure_password
  validates_uniqueness_of :username
  validates_length_of :username, maximum: USERNAME_MAX_LENGTH, minimum: USERNAME_MIN_LENGTH
  validates_length_of :password, maximum: PASSWORD_MAX_LENGTH, minimum: PASSWORD_MIN_LENGTH
  validate :username_legibility, :password_legibility, on: %i[create update]

  has_many :tasks, dependent: :destroy

  def username_legibility
    errors.add(:username, "can't use special charaters") if /\W+/.match?(username)
  end

  def password_legibility
    errors.add(:password, 'should contains at least 1 upper case, 1 lower case, 1 number') unless legal_password
  end

  private

  def legal_password
    /\d+/.match?(password) && /[A-Z]+/.match?(password) && /[a-z]+/.match?(password)
  end
end
