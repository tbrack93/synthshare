class AddAdvancedSkillsToSynths < ActiveRecord::Migration[5.2]
  def change
    add_column :synths, :cardiothoracic, :boolean, default: false
    add_column :synths, :quantumelectrodynamics, :boolean, default: false
    add_column :synths, :architecturalengineering, :boolean, default: false
  end
end
