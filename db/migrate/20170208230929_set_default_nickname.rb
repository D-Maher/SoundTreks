class SetDefaultNickname < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :nick_name, :string, :default => "Trekker"
  end
end
