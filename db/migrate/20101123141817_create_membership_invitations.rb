class CreateMembershipInvitations < ActiveRecord::Migration
  def self.up
    create_table :membership_invitations do |t|
      t.references :user
      t.references :group
      t.integer :admin_id

      t.timestamps

    end
    add_index(:membership_invitations ,[:group_id, :user_id], :unique => true)
  end

  def self.down
    drop_table :membership_invitations
  end
end
