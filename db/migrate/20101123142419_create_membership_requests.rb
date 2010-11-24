class CreateMembershipRequests < ActiveRecord::Migration
  def self.up
    create_table :membership_requests do |t|
      t.references :user
      t.references :group
      t.boolean :accepted, :default => false
      t.integer :accepting_admin_id

      t.timestamps
    end

    add_index(:membership_requests, [:user_id,:group_id], :unique => true)
  end

  def self.down
    drop_table :membership_requests
  end
end
