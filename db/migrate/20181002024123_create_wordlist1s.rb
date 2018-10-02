class CreateWordlist1s < ActiveRecord::Migration[5.2]
  def change
    create_table :wordlist1s do |t|
      t.string :word

      t.timestamps
    end
  end
end
