class CreateNewsletterlists < ActiveRecord::Migration[7.1]
  def change
    create_table :newsletterlists do |t|
      t.string :name

      t.timestamps
    end
  end
end
