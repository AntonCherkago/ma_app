class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.integer  :status
      t.timestamps
      t.belongs_to :user
      t.belongs_to :group
    end
  end
end
