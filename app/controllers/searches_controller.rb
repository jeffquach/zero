class SearchesController < ApplicationController
	
	def update_topics
		subject = Subject.find(params[:subject_id])
		if subject.topics.blank?
			@topics = [].insert(0,"No topics available")
		else
			@topics = subject.topics.order('lower(name) ASC').map{|t| t.name}.uniq.insert(0,"Select topic")	
		end
	end
end