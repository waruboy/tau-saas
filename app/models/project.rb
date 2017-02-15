class Project < ActiveRecord::Base
  belongs_to :tenant
  has_many :artifacts, dependent: :destroy

  validates :title, uniqueness: true
  validates :tenant, presence: true
  validate :free_plan_can_only_have_one_project

  def self.by_plan_and_tenant(tenant_id)
    tenant = Tenant.find(tenant_id)
    if tenant.plan == 'premium'
      tenant.projects
    else
      tenant.projects.order(:id).limit(1)
    end
  end


  def free_plan_can_only_have_one_project
    return unless (self.new_record? && (tenant.projects.count > 0) && (tenant.plan == 'free'))

    errors.add(:base, "Free plans cannot have more than one project")
  end
end


