class AddBirthDateToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :birth_date, :date
  	add_column :users, :gender, :text
  end
end
