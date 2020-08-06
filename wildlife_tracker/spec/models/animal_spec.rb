require 'rails_helper'
# require 'spec_helper'
# require_relative './app/controllers/animals_controllers.rb'

RSpec.describe Animal, type: :model do
  it 'has to be real' do
    test_animal = Animal.create common_name: "Test", latin_name: "Testmus test", taxonomy_class: "a_test"
    expect(test_animal).to be_valid
  end

  it 'has a common name' do
    test_animal = Animal.create latin_name: "Test", taxonomy_class: "a_test"
    expect(test_animal).to_not be_valid
   
  end

  it 'has unique common and latin names' do
    test_animal = Animal.create common_name: "Test",  latin_name: "Test", taxonomy_class: "a_test"
    test_animal.valid?
    expect(test_animal.errors[:latin_name]).to include("Latin name cannot be the same as the common latin...because latin isn't common")
    
  end


end

