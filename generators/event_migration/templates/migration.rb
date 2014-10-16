class Create<%= class_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
      t.string :event_type
      t.references :object, :polymorphic => true
      t.references :user
      t.timestamps
    end

    add_index :<%= table_name %>, :event_type
    add_index :<%= table_name %>, [:object_type, :object_id]
    add_index :<%= table_name %>, :user_id
  end

  def self.down
    drop_table :<%= table_name %>
  end
end
