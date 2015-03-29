class CreateClientsMessages < ActiveRecord::Migration
  def change
    create_table :clients_messages do |t|
    	 t.belongs_to :client, index: true
      t.belongs_to :message, index: true
    end
  end
end
