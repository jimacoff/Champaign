class RegisteredTargetEndpoint < ApplicationRecord
  validates :url, presence: true
  validates :name, presence: true

  def self.all_for_select
    RegisteredTargetEndpoint.all.map { |e| [e.name, e.id] }
      .unshift(['Global Pension Funds', ''])
  end
end
