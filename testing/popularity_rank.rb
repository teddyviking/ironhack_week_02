require 'pry'
class City
	attr_reader :points_of_interest
	def initialize(*pois)
		@points_of_interest = {}
		pois.each{|poi| @points_of_interest[poi.name.to_sym] = poi }
	end

	def show_points_of_interest
		@points_of_interest.map{|key, value| key.to_s}
	end

	def rank_by_visits
		result = []

		ordered_points_of_interest = @points_of_interest.values.sort do |a, b|
			b.number_of_visits <=> a.number_of_visits
		end	
		
		ordered_points_of_interest.each {|point_of_interest| result << point_of_interest.name}
		result
	end
end

class PointOfInterest
	attr_reader :name, :number_of_visits, :number_of_comments
	def initialize(name, visits, comments)
		@name = name
		@number_of_visits = visits
		@number_of_comments = comments
	end
end


# ["sol", "prado"]
