require_relative '../spec_helper'

describe Guide do

  before do
    Guide.create!(name: "Hash conditions", explanation: "Looks at the hash")
    Guide.create!(name: "Array conditions", explanation: "looks at the array settings")
    Guide.create!(name: "Placeholder conditions", explanation: "This is a Placeholder now")
  end

  it "Sorts items alphabetically by default" do
  	expect(Guide.all.first.name).to eq("Array conditions")
  end

  it "Checks if a new guide name is unique" do
    new_guide = Guide.new(name: "Placeholder conditions", explanation: "Has a new explanation")
    expect(new_guide.valid?).to eq(false)
  end

  it "Checks if a new guide explanation is longer than two letters" do
    new_guide = Guide.new(name: "Someother conditions", explanation: "m")
    expect(new_guide.valid?).to eq(false)
  end

  it "Checks if a new guide name is longer than two letters" do
    new_guide = Guide.new(name: "S", explanation: "This explanation is very long")
    expect(new_guide.valid?).to eq(false)
  end

end
