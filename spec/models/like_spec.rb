require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(post_id: Post.new(user: User.new(name: 'omar', photo: 'imagephoto', bio: 'software engineer'), title: 'My title', text: 'My hello world test').id , user_id:  User.new(name: 'omar', photo: 'imagephoto', bio: 'software engineer').id) }
  before { subject.save }

  it 'if post_id is integer' do
    subject.user_id = "ss"
    expect(subject).to_not be_valid
  end
  it 'if post_id is integer' do
    subject.post_id = "123"
    expect(subject).to_not be_valid
  end
end
