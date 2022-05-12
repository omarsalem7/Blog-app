require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(user: User.new(name: 'omar', photo: 'imagephoto', bio: 'software engineer'), title: 'My title',
             text: 'My hello world test')
  end
  before { subject.save }

  it 'validate post' do
    expect(subject).to be_valid
  end

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'if comments counter is float' do
    subject.comments_counter = 0.25
    expect(subject).not_to be_valid
  end

  it 'post counter must be an integer' do
    subject.comments_counter = 'hello'
    expect(subject).to_not be_valid
  end

  it 'post counter must 0 or greater than not negative numbers' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
