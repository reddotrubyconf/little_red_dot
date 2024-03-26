class AddSponsorshipProspectusToConference < ActiveRecord::Migration[7.0]
  def change
    add_column :conferences, :sponsorship_prospectus, :string
  end
end
