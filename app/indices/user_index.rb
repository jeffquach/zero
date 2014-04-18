ThinkingSphinx::Index.define :user, :with => :active_record do
  # fields
  indexes city
  indexes topics.name, :as => :topic_name

  # attributes
  # has author_id, created_at, updated_at
  has subjects(:id), :as => :subject_name
end