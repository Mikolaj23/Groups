class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.references :user
      t.references :group
      t.boolean :banned, :default => false
      t.boolean :admin

      t.timestamps
    end

    add_index(:memberships, [:user_id,:group_id], :unique => true)
  end

  def self.down
    drop_table :memberships
  end
end
