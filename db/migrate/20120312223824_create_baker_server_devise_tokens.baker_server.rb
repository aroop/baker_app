# This migration comes from baker_server (originally 20120312132149)
class CreateBakerServerDeviseTokens < ActiveRecord::Migration
  def change
    create_table :baker_server_devise_tokens do |t|
      t.string :token
      t.references :user
      t.timestamps
    end
  end
end
