# Los usuarios normales del sistema.
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :validatable, :confirmable, :trackable

  has_many :descargos, dependent: :destroy
end
