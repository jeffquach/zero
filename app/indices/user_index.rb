ThinkingSphinx::Index.define :user, :with => :active_record do
  # fields
  indexes city
  indexes topics.name, :as => :topic_name
  indexes topics.experience, :as => :experience

  # attributes
  # has author_id, created_at, updated_at
  has subjects(:id), :as => :subject_name
  has 'AVG(reviews.rating)', :as => :review, :type => :float
  has reviews.rating, :as => :review_rating, :type => :integer
end