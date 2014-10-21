json.planned_meetings do
  json.array!(@meetings) do |meeting|
    json.extract! meeting, :id, :name, :description, :trashed, :template, :draft, :archived, :completed, :privacy, :starts_at, :ends_at, :all_day, :location_comments, :color, :created_at, :updated_at
    json.url meeting_url(meeting)

    json.creator do 
      json.name meeting.try(:creator).try(:name) 
      json.full_name meeting.try(:creator).try(:full_name) 
      json.description meeting.try(:creator).try(:description) 
      json.avatar_url meeting.try(:creator).try(:avatar_url) 
    end

    json.location do 
      json.name meeting.try(:location).try(:name) 
      json.address_1 meeting.try(:location).try(:address_1) 
      json.address_2 meeting.try(:location).try(:address_2) 
      json.city meeting.try(:location).try(:city) 
      json.state meeting.try(:location).try(:state) 
      json.zip meeting.try(:location).try(:zip) 
    end

    json.participants do
      json.array!(meeting.participants) do |participant|
        if current_user == meeting.creator
          json.extract! participant, :id, :name, :full_name, :first_name, :last_name, :description, :email, :created_at, :updated_at
        else
          json.extract! participant, :id, :name, :full_name, :first_name, :last_name, :description, :email, :created_at, :updated_at
        end
        json.url participant_url(participant)

      end
    end

    json.agenda_items do
      json.array!(meeting.agenda_items) do |agenda_item|
        if current_user == agenda_item.meeting.creator
          json.extract! agenda_item, :id, :ends_at, :starts_at, :completed, :trashed, :description, :position, :presenter, :name, :created_at, :updated_at
        else
          json.extract! agenda_item, :id, :ends_at, :starts_at, :completed, :trashed, :description, :position, :presenter, :name, :created_at, :updated_at
        end
        json.url agenda_item_url(agenda_item)

      end
    end

  end
end


