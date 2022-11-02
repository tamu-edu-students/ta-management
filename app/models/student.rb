class Student < ApplicationRecord
    validates :name, presence: true, format: { with: /([\w\-\']{2,})([\s]+)([\w\-\']{2,})/ }
    validates :email_id, presence: true
    validates :uin, presence: true, length: { is: 9 }, format: { with: /\A[0-9]*\z/ }
  :attr_accessor
end
