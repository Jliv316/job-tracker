require 'rails_helper'

describe Comment, type: :model do
  describe 'Validations' do
    it {should belong_to(:job)}
  end
end