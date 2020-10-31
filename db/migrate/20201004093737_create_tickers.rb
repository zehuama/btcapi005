class CreateTickers < ActiveRecord::Migration[6.0]
  def change
    create_table :tickers do |t|
      t.string :symbol
      t.decimal :openPrice
      t.decimal :closePrice
      t.string :openTime
      t.datetime :closeTime
      t.timestamps
    end
    add_index :tickers, :symbol
  end
end
