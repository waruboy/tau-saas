class AddPlanToTenants < ActiveRecord::Migration
  def change
    add_column :tenants, :plan, :text
  end
end
