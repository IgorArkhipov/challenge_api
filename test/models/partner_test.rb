# frozen_string_literal: true

# == Schema Information
#
# Table name: partners
#
#  id               :integer          not null, primary key
#  latitude         :decimal(10, 6)   not null
#  longitude        :decimal(10, 6)   not null
#  name             :string           not null
#  operating_radius :decimal(6, 3)    not null
#  rating           :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'test_helper'

class PartnerTest < ActiveSupport::TestCase
  test 'should remove referenced material relations on destroy' do
    assert_difference('MaterialRelation.count', -1) do
      partners(:one).destroy
    end
  end

  %i[latitude longitude].each do |attr|
    test "should have #{attr} in number format" do
      partner = partners(:one)

      partner.send("#{attr}=", 'text')
      assert_not partner.valid?

      partner.send("#{attr}=", true)
      assert_not partner.valid?

      partner.send("#{attr}=", -2.230)
      assert partner.valid?

      partner.send("#{attr}=", 3.120)
      assert partner.valid?
    end
  end

  test 'should have latitude in strong boundaries' do
    partner = partners(:one)

    partner.latitude = -90.5
    assert_not partner.valid?

    partner.latitude = 90.5
    assert_not partner.valid?

    partner.latitude = 90
    assert partner.valid?
  end

  test 'should have longitude in strong boundaries' do
    partner = partners(:one)

    partner.longitude = -180.5
    assert_not partner.valid?

    partner.longitude = 180.5
    assert_not partner.valid?

    partner.longitude = 180
    assert partner.valid?
  end

  test 'operating_radius should be positive' do
    partner = partners(:one)

    partner.operating_radius = 0
    assert_not partner.valid?
  end

  test 'rating should be greater or equal zero if present' do
    partner = partners(:three)

    partner.rating = -1
    assert_not partner.valid?
  end
end
