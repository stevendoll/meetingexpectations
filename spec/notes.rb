rails generate scaffold Location name:string address_1:text address_2:text city:string state:string zip:string
rails generate scaffold Meeting creator_id:uuid description:text deleted:boolean location:string planned_start:datetime planned_end:datetime title:string

rails generate scaffold AgendaItem actual_end:datetime actual_start:datetime completed:boolean created_on:datetime deleted:boolean description:text duration:float modified_on:datetime order:float presenter_id:uuid title:text meeting_id:uuid

rails generate scaffold MeetingParticipant meeting_id:uuid participant_id:uuid attended:boolean participant_type_id:uuid

rails generate scaffold Task name:string description:text planned_start:datetime planned_end:datetime is_deleted:boolean display_order:float


rails generate scaffold AgendaItem actual_end:datetime actual_start:datetime creator_agenda_item_id:string is_completed:boolean created_on:datetime is_deleted:boolean desc:text duration:float modified_on:datetime order:float presenter:string title:string type:string meeting:references



rails generate scaffold CommentType name:string display_order:float
rails generate scaffold StatusType name:string display_order:float
rails generate scaffold Status title:string description:text status_on:datetime status_type_id:uuid created_by:uuid project_id:uuid

rails generate scaffold Comment creator_id:uuid description:text

rails generate scaffold Meeting name:text description:text trashed:boolean template:boolean draft:boolean archived:boolean completed:boolean privacy:text starts_at:datetime ends_at:datetime all_day:boolean creator_id:uuid account_id:uuid location_id:uuid location_comments:text color:string

rails generate scaffold Participant meeting_id:uuid user_id:uuid attended:boolean description:text

rails generate scaffold AgendaItem ends_at:datetime starts_at:datetime completed:boolean trashed:boolean description:text position:float presenter:string name:text meeting_id:uuid

rails generate scaffold Task name:string description:text planned_start:datetime planned_end:datetime trashed:boolean position:float meeting_id:uuid

rails generate scaffold Device device_type:string device_token:string user_id:uuid

rails generate scaffold Location name:string address_1:text address_2:text city:string state:string zip:string account_id:uuid

rails generate scaffold Group name:string account_id:uuid creator_id:uuid parent_group_id:uuid

rails generate scaffold Account name:string creator_id:uuid

# polymorphic

rails generate scaffold Comment creator_id:uuid description:text
rails generate scaffold Note creator_id:uuid description:text
rails generate scaffold Attachment creator_id:uuid description:text



{
    "id": 605816632,
    "name": "BCX",
    "description": "The Next Generation",
    "updated_at": "2012-03-23T13:55:43-05:00",
    "url": "https://basecamp.com/999999999/api/v1/projects/605816632.json",
    "app_url": "https://basecamp.com/999999999/projects/605816632",
    "template": false,
    "archived": false,
    "starred": true,
    "trashed": false,
    "draft":false,
    "is_client_project": false,
    "color": "3185c5"
  },

todo
{
  "id": 1,
  "todolist_id": 1000,
  "position": 1,
  "content": "Design it",
  "completed": false,
  "due_at": "2012-03-27",
  "created_at": "2012-03-24T09:53:35-05:00",
  "updated_at": "2012-03-24T10:56:33-05:00",
  "comments_count": 1,
  "private": false,
  "trashed": false,
  "creator": {
    "id": 127326141,
    "name": "David Heinemeier Hansson",
    "avatar_url": "https://asset0.37img.com/global/9d2148cb8ed8e2e8ecbc625dd1cbe7691896c7d9/avatar.96.gif?r=3",
    "fullsize_avatar_url": "https://asset0.37img.com/global/9d2148cb8ed8e2e8ecbc625dd1cbe7691896c7d9/original.gif?r=3"
  },
  "assignee": {
    "id": 149087659,
    "type": "Person",
    "name": "Jason Fried"
  },
  "comments": [
    {
      "id": 1028592764,
      "content": "+1",
      "created_at": "2012-03-24T09:53:34-05:00",
      "updated_at": "2012-03-24T09:53:34-05:00",
      "creator": {
        "id": 127326141,
        "name": "David Heinemeier Hansson",
        "avatar_url": "https://asset0.37img.com/global/9d2148cb8ed8e2e8ecbc625dd1cbe7691896c7d9/avatar.96.gif?r=3",
        "fullsize_avatar_url": "https://asset0.37img.com/global/9d2148cb8ed8e2e8ecbc625dd1cbe7691896c7d9/original.gif?r=3"
      }
    }
  ],
  "subscribers": [
    {
      "id": 149087659,
      "name": "Jason Fried"
    },
    {
      "id": 1071630348,
      "name": "Jeremy Kemper"
    }
  ]
}


