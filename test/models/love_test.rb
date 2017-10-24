require "test_helper"

describe Love do
  let(:love) { Love.new }

  it "must be valid" do
    value(love).must_be :valid?
  end
end
