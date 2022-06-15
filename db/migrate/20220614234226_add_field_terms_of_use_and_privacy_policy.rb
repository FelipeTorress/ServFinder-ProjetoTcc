class AddFieldTermsOfUseAndPrivacyPolicy < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :accepted_terms_of_use, :boolean
    add_column :users, :accepted_privacy_policy, :boolean
  end
end
