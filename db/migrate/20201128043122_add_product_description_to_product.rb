class AddProductDescriptionToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :product_description, :text
    add_column :products, :manufacturer, :string
  end
end
