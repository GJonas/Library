require 'spec_helper'

describe Loan do

  let(:user) { FactoryGirl.create(:user) }
  let(:book) { FactoryGirl.create(:book) }
  before do
    # This code is not idiomatically correct.
    @loan = Loan.new(data: "01/10/2013", user_id: user.id, book_id: book.id)
  end

  subject { @loan }

  it { should respond_to(:book_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

   describe "when user_id is not present" do
    before { @loan.user_id = nil }
    it { should_not be_valid }
  end
end