require 'spec_helper'

describe Microblog do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @Microblog = Microblog.new(content: "Lorem ipsum", user_id: user.id)
  end

  subject { @Microblog }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }

  describe "when user_id is not present" do
    before { @Microblog.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @Microblog.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @Microblog.content = "a" * 141 }
    it { should_not be_valid }
  end
end
