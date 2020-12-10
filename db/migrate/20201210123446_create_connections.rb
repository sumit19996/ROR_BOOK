class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
    	t.references :sender, references: :users
    	t.references :reciever, references: :users 
    	t.timestamps
    end
  end
end
