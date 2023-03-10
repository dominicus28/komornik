class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many(:groupinfos)
  has_many :bills, dependent: :destroy
  has_many :commitments, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  before_destroy :remove_from_groups_commitments

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :login, presence: true, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true, length: { minimum: 8, maximum: 255 }
  validates :mail, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  def remove_from_groups_commitments
    self.groupinfos.clear
    self.commitments.clear
  end
end
