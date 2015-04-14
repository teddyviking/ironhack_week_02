class Task
	attr_reader :text, :priority, :state, :id, :date
	def initialize(text, priority, id)
		@id = id
		@text = text
		@priority = priority
		@state = "undone"
		@date = Time.now
	end

	def change_state
		@state == "undone" ? @state = "done" : @state = "undone"
	end
end