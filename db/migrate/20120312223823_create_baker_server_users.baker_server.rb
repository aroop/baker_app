# This migration comes from baker_server (originally 20120312131928)
class CreateBakerServerUsers < ActiveRecord::Migration
  def change
    create_table :baker_server_users do |t|
      t.string :email_address
      t.string :password

      t.timestamps
    end
  end
end
