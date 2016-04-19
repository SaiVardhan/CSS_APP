class CreatePageTable < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.string :bg_color
    	t.string :font
    end
  end
end
