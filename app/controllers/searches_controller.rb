class SearchesController < ApplicationController
	
	def index
		if params[:search].blank?
	      flash[:danger] = "The search field cannot be blank!"
	      redirect_to root_url and return
	    elsif params[:search]  
	      @search = Sunspot.search(User,Subject,Topic) do |query|
	        query.fulltext params[:search] 
	        query.paginate :page => 1, :per_page => 50
	        query.with(:location).in_radius(*Geocoder.coordinates(params[:search]),100,:bbox => true)
	        query.order_by_geodist(:location,*Geocoder.coordinates(params[:search]))
	        query.with :subjects, params[:subject_search] if params[:subject_search].present?
	        query.with :topics, params[:topic_search] if params[:topic_search].present?
	      end
	      @users = @search.results
	      if @users.empty?
	        flash[:danger] = "No users found"
	        redirect_to root_url and return
	      end
	    else
	      redirect_to root_url
	    end
	end

	private
	def search_params
		params.require(:search).permit(:city,:subject_name,:topic_name,:experience)
	end
end