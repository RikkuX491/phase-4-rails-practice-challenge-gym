class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships

    def total_amount_for_all_membership
        self.memberships.sum { |m| m.charge }
    end
end
