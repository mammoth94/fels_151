class CreateWordlists < ActiveRecord::Migration[5.2]
  def change
    create_table :wordlists do |t|
      t.string :word
      t.timestamps
    end
  end
end
