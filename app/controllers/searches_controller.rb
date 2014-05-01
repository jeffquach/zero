class SearchesController < ApplicationController
	
	def update_topics
		subject = Subject.find(params[:subject_id])
		if subject.topics.blank?
			@topics = []
		else
			@topics = subject.topics.order('lower(name) ASC').map{|t| t.name}.uniq	
		end
	end

	def load_cities
		@cities = User.uniq.pluck(:city)

		respond_to do |format|
			format.json {render json: @cities.to_json}
		end
	end
end