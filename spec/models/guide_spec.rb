require_relative '../spec_helper'

describe Guide do
  it "Sorts items alphabetically by default" do
  	Guide.create(name: "f")
  	Guide.create(name: "a")
  	Guide.create(name: "z")
  	expect(Guide.all.first.name).to eq("a")
  end
end