class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.date 		:start_date, 	null: false	
      t.date 		:end_date,		null: false
      t.references 	:user,			null: false
      t.timestamps					null: false
    end
    add_foreign_key :payments, :users
  end
end
