class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients, id: :string do |t|
      t.timestamps
    end
  end
end
