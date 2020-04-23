class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :permalink
      t.string :name
      t.boolean :is_certificated
      t.string :email
      t.string :new_email
      t.string :password_digest
      t.string :image
      t.string :url
      t.string :twitter_uid
      t.string :twitter_url
      t.string :twitter_token
      t.string :twitter_token_secret
      t.string :github_uid
      t.string :github_url
      t.string :description
      t.string :location
      t.string :birth

      t.timestamps
    end
  end
end
