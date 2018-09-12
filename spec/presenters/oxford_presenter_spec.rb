require 'rails_helper'

describe Presenter do
  it "exists" do
    params = {"search": "foxes"}
    expect(Presenter.new(params)).to be_a Presenter
  end

  context "instance methods" do
    context "#word_response" do
      it "returns appropriate word response" do
        params = {"search": "foxes"}
        expect(Presenter.new(params).word_response).to eq("'foxes' is a valid word and its root form is 'fox'")

        params = {"search": "foxez"}
        expect(Presenter.new(params).word_response).to eq("'foxez' is not a valid word.")
      end
    end
  end
end
