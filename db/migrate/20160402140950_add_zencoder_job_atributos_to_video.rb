class AddZencoderJobAtributosToVideo < ActiveRecord::Migration
  def change
    change_table(:videos) do |t|
      t.integer :job_id
      t.string :arquivo_convertido
    end
  end

  def down
    remove_column :videos, :job_id
    remove_column :videos, :arquivo_convertido
  end
end
