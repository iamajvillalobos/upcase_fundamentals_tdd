require 'rspec/autorun'

# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    if @middle_name
      "#{@first_name} #{@middle_name} #{@last_name}"
    else
      "#{@first_name} #{@last_name}"
    end
  end

  def full_name_with_middle_initial
    if @middle_name
      "#{@first_name} #{middle_initial}. #{@last_name}"
    else
      "#{@first_name} #{@middle_name} #{@last_name}"
    end
  end

  def initials
    if @middle_name
      "#{firstname_initial}#{middle_initial}#{lastname_initial}"
    else
      "#{firstname_initial}#{lastname_initial}"
    end
  end

  private

  def firstname_initial
    "#{@first_name[0]}"
  end

  def middle_initial
    if @middle_name
      "#{@middle_name[0].upcase}"
    end
  end

  def lastname_initial
    "#{@last_name[0]}"
  end

end

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      person = Person.new(first_name: "Firstname",
                           middle_name: "Middlename",
                           last_name: "Lastname")
      expect(person.full_name).to eq("Firstname Middlename Lastname")
    end
    it "does not add extra spaces if middle name is missing" do
      person = Person.new(first_name: "Firstname",
                           last_name: "Lastname")
      expect(person.full_name).to eq("Firstname Lastname")
    end
  end

  describe "#full_name_with_middle_initial" do
    it "return full name with a middle initial with spaces" do
      person = Person.new(first_name: "Firstname",
                           middle_name: "Middlename",
                           last_name: "Lastname")
      expect(person.full_name_with_middle_initial).to eq("Firstname M. Lastname")
    end

    it "does not add extra spaces of middle name is missing" do
      person = Person.new(first_name: "Firstname",
                           last_name: "Lastname")
      expect(person.full_name_with_middle_initial).to eq("Firstname Lastname")
    end
  end

  describe "#initials" do
    it "return all initials" do
      person = Person.new(first_name: "Firstname",
                           middle_name: "Middlename",
                           last_name: "Lastname")
      expect(person.initials).to eq("FML")
    end

    it "does not return middle name initial if middle name is missing" do
      person = Person.new(first_name: "Firstname",
                           last_name: "Lastname")
      expect(person.initials).to eq("FL")
    end
  end
end

