class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.decimal :value
      t.decimal :fee
      t.decimal :month
      t.references :requester, null: false, foreign_key: true

      t.timestamps
    end
  end
end
