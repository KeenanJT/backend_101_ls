# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* DEBUGGING *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 
# Debugging is at the core of programming.

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* TEMPERAMENT *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 
# If the key to programming is debugging, then the key to debugging is having a patient and logical temperament.
# EXAMPLE - Miss the buss
  # Programmer would figure out
    # 1) when te next one comes
    # 2) if there's an alternative path of transfers to take
    # 3) other alternative forms of transportation
# Dealing with feelings of frustration is the first critical aspect of learning to program.

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* READING ERROR MESSAGES *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 
# Stack Trace is the error message that is returned by the compiler. Reading this is important in understanding and figuring out what went wrong.
# EXAMPLE - Stack Trace error
NoMethodError: undefined method `name' for nil:NilClass
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/has_many_association.rb:80:in `cached_counter_attribute_name'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/has_many_association.rb:76:in `has_cached_counter?'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/has_many_association.rb:84:in `update_counter'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/has_many_through_association.rb:66:in `insert_record'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/collection_association.rb:523:in `block (2 levels) in concat_records'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/collection_association.rb:367:in `add_to_target'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/collection_association.rb:522:in `block in concat_records'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/collection_association.rb:520:in `each'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/collection_association.rb:520:in `concat_records'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/has_many_through_association.rb:43:in `concat_records'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/collection_association.rb:137:in `block in concat'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/collection_association.rb:152:in `block in transaction'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/connection_adapters/abstract/database_statements.rb:202:in `block in transaction'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/connection_adapters/abstract/database_statements.rb:210:in `within_new_transaction'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/connection_adapters/abstract/database_statements.rb:202:in `transaction'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/transactions.rb:209:in `transaction'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/collection_association.rb:151:in `transaction'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/collection_association.rb:137:in `concat'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/has_many_through_association.rb:37:in `concat'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/activerecord-4.0.0/lib/active_record/associations/collection_proxy.rb:945:in `<<'
    from (irb):27
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/railties-4.0.0/lib/rails/commands/console.rb:90:in `start'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/railties-4.0.0/lib/rails/commands/console.rb:9:in `start'
    from /Users/jim/.rvm/gems/ruby-2.2.1/gems/railties-4.0.0/lib/rails/commands.rb:64:in `<top (required)>'
    from bin/rails:4:in `require'
    from bin/rails:4:in `<main>'2.2.1 :028 >'
# Error message is at the top: NoMethodError: undefined method 'name' for nil:NilClass
# Study the trace to see what's the issue for the above error I believe 'name' method or variable was used everywhere, but either was a local variable or not created.

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* ONLINE RESOURCES *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 

# 1. Search Engines
  # Use only the relevant information from the error message, things that are not computer and program specific.
  # Add the programming language in front of the error message to filter down the results
    # Example - Search - "Ruby NoMethodError: undefined method"
# 2. Stack Overflow
  # A Q/A website for programmers. Also has search functionality
# 3. Documentation
  # Original documentation is great for understanding core functionality of the classes, and methods you're using.

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* STEPS TO DEBUGGING *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 
# 1. Reproduce the Error
  # Once you have a deterministic way to consistently reproduce the problem then you can start to isolate the root cause.
  # Reproducing the error will often be the trickiest situation, but will return many rewards/clues

# 2. Determine the Boundaries of the Error
  # Once you can reproduce the problem then you need to tweak the data, and methods that caused the error.
  # If 'post.categories << news' caused an error then we would want to do/ask the following:
    # Does calling 'post.categories' cause issues?
    # What about just calling 'post'?
    # What happens if we try to append a different object, like this: 'post.categories << sports'?
    # How does modifying the data affect the program behavior?
    # Do we get expected errors, or does a new error occur that sheds light on the underlying problem?
  # Essentially, all of this is trying to modify the data or code to get an idea of the scope of the error, and determine the boundaries of the problem.
  # Leading, to a deeper understanding of the problem, and allowing us to implement a better solution.

# 3. Trace the Code
  # Once you understand the boundaries of the problem, it's time to trace the code
  # EXAMPLE - Car Class
class Car
  attr_accessor :brand, :model

  def initialize(new_car)
    brand = new_car.split(' ').first
    model = new_car.split(' ').last
  end
end

betty = Car.new('Ford Mustang')
betty.model.start_with?('M') # => NoMethodError: undefined method 'start_with?' for nil:NilClass
# After testing various data inputs we notice brand and model methods are returning nil
# Let's trace the code backwards. When you first instantiate a new Car object, a string is passed into the constructor. 
# The string, represented by the new_car local variable, is split and the first value is set as the brand, while the second value is set as the model. 
# Once set, these values can then be retrieved by the associated getter methods. 
# However, the getter method returns nil. Therefore, either we're not setting it correctly, or it's being turned into nil somewhere along the way. 
# This is trapping the error.

# 4. Understand the Problem Well
# Working carefully line by line, and inspecting the variable values each step of the way, you notice that the initial setting of the values doesn't seem to take hold.
# For example, this code "brand = new_car.split(' ').first" doesn't seem to have the desired effect, because if you put a puts self.brand right after that line, it returns nil. 
# The problem is subtle, but obvious in hindsight: brand = ... and model = ... are actually local variables. 
# What we meant to do is call the setter methods, which requires a self.brand = ... and self.model = ....

# In object oriented programming, we use intance variables to keep track of an object's state.
# brand and model are the objects, but were local variables and not instance variables of the new_car parameter.

# Instance Variable Solution:
def initialize(new_car)
  self.brand = new_car.split(' ').first
  self.model = new_car.split(' ').last
end

# Referencing Instance Variable Solution:
def initialize(new_car)
  @brand = new_car.split(' ').first
  @model = new_car.split(' ').last
end

# 5. Implement a Fix
  # Supressing the error with "rescue"
betty.model.start_with?('M') rescue false # => false
  # But this is a code smell, aka it shows that you haven't thought carefully about the possible problems that could go wrong, and therefore you haven't thought about how to handle the potential error conditions.
  # Important note: fix one problem at a time. It's common to notice

# 6. Test the Fix
  # Verify that the code fixed the problem by using a similar set of tests from step #2.

# ~*~*~*~~*~*~*~*~*~*~*~*~*~*~~~~~* Techniques for Debugging *~~~~~*~*~*~*~~*~*~*~*~*~*~*~*~*~* # 
# 1. Line by line
  # Patience and temperment to look through the code line-by-line, word-by-word, and character-by-character.

# 2. Rubber Duck
  # Using an object as a sounding board for hard problems. Since you're forced to explain the problem in detail, thus understanding the logic, and further loading it into your brain.

# 3. Walking Away
  # After loading the problem in your brain, let it subconciously work on the solution

# 4. Using Pry
  # It's a Ruby REPL that can replace IRB.
  # You can put pry into your scripts to stop execution at certain points, and see what certain sections are returning.
  # It also has recommendations

# 5. Using a Debugger
  # Pry is the only debugger we will use but there are more advanced systems.
  














