class Task
	attr_reader :text, :priority, :state, :id, :date
	def initialize(text, priority, id)
		@id = id
		@text = text
		@priority = priority
		@state = "undone"
		@date = Time.now.strftime("%A %d at %H:%M")
	end

	def change_state
		@state == "undone" ? @state = "done" : @state = "undone"
	end

	def task_to_JSON
		task = {
			id: @id,
			text: @text,
			priority: @priority,
			state: @state,
			date: @date
		}
		JSON.generate(task)
	end
end