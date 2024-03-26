class ConferenceResource < Madmin::Resource
  # Attributes
  attribute :id, form: false
  attribute :name
  attribute :address
  attribute :start_date
  attribute :end_date
  attribute :agenda
  attribute :active
  attribute :call_for_papers
  attribute :sponsorship_prospectus
  attribute :created_at, form: false
  attribute :updated_at, form: false

  # Associations
  attribute :papers
  attribute :subscribers

  # Uncomment this to customize the display name of records in the admin area.
  # def self.display_name(record)
  #   record.name
  # end

  # Uncomment this to customize the default sort column and direction.
  # def self.default_sort_column
  #   "created_at"
  # end
  #
  # def self.default_sort_direction
  #   "desc"
  # end
end
