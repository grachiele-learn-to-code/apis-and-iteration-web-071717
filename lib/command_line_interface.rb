def welcome
  puts "Welcome to the Star Wars API!"
  # puts out a welcome message here!
end
def get_character_from_user
  puts "please enter a character"
  user_input = gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
