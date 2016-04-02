class AddDuracaoAndTamanhoToVideo < ActiveRecord::Migration
  def change
    change_table(:videos) do |t|
      t.integer :largura
      t.integer :altura
      t.integer :tamanho_bytes
      t.integer :duracao
    end
  end

  def down
    remove_column :videos, :largura
    remove_column :videos, :altura
    remove_column :videos, :tamanho_bytes
    remove_column :videos, :duracao
  end
end
