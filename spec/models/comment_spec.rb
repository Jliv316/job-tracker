require 'rails_helper'

describe Comment do
  describe 'Validations' do
    it {should belong_to(:job)}
  end
end