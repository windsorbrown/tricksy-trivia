# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    # filename=File.absolute_path('db/questions.csv')
    # field_names = ['questions', 'answers']
    # puts "Importing questions from '#{@filename}'"
    # failure_count = 0
    # Question.transaction do
    #   File.open(@filename).each do |line|
    #     data = line.chomp.split(',')
    #     attribute_hash = Hash[field_names.zip(data)]
    #     begin
    #       Question.create!(attribute_hash)
    #       print '.'
    #     rescue ActiveRecord::UnknownAttributeError
    #       failure_count += 1
    #       print '!'
    #     ensure
    #       STDOUT.flush
    #     end
    #   end
    # end
    # failures = failure_count > 0 ? "(failed to create #{failure_count} user records)" : ''
    # puts "\nDONE #{failures}\n\n"


