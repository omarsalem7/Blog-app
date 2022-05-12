require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'omar', photo: 'imagephoto', bio: 'software engineer') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post counter must be an integer' do
    subject.posts_counter = 'hello'
    expect(subject).to_not be_valid
  end

  it 'post counter must 0 or greater than not negative numbers' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
end
