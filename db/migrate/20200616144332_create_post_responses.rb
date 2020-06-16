class CreatePostResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :post_responses do |t|
      t.references :post, foreign_key: true
      t.string :name
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end
