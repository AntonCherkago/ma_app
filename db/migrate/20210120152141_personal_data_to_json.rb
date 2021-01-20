class PersonalDataToJson < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :personal_data, :jsonb, using: 'to_jsonb(personal_data)'
  end
end
