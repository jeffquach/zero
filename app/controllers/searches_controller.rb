class SearchesController < ApplicationController
	
	def update_topics
		subject = Subject.find(params[:subject_id])
		if subject.topics.blank?
			@topics = []
		else
			@topics = subject.topics.order('lower(name) ASC').map{|t| t.name}.uniq	
		end
	end
end