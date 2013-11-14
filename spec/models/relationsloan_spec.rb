require 'spec_helper'

describe Relationship do

  let(:loan) { FactoryGirl.create(:user) }
  
  let(:relationsloan) { book.relationsloan.build(book_id: book.id) }

  subject { relationsloan }

  it { should be_valid }