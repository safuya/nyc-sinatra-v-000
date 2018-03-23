class CreateFiguresTitles < ActiveRecord::Migration[5.1]
  def change
    create_table :figures_titles do |t|
      t.belongs_to :figure
      t.belongs_to :title
    end
  end
end
