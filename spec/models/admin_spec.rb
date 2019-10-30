# frozen_string_literal: true

RSpec.describe Admin, type: :model do
  let(:admin) { Admin.create!(password: 'TestPassword123') }

  specify 'should successfully authenticate with correct password' do
    expect(admin.authenticate('TestPassword123')).to eq(admin)
  end

  specify 'should not successfully authenticate with wrong password' do
    expect(admin.authenticate('WrongPassword')).to eq(false)
  end
end
