require_relative '../spec_helper'

describe Topic do
  it "Sorts topics alphabetically by default" do
    Topic.create(name: "Models Topic")
    Topic.create(name: "Query Topic")
    Topic.create(name: "Associations Topic")
    expect(Topic.all.first.name).to eq("Associations Topic")
    end
  end
end
