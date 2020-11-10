# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, :moderator_id, presence: true
    validates :title, uniqueness: true

    belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: :User

    has_many :post_subs, dependent: :destroy, inverse_of: :sub

    has_many :posts,
        through: :post_subs,
        source: :post

    has_many :authors,
        through: :posts,
        source: :author

end
