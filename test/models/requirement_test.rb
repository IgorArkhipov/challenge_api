# frozen_string_literal: true

require 'test_helper'

class RequirementTest < ActiveSupport::TestCase
  test 'should have latitude in strong boundaries' do
    assert_not Requirement.new(latitude: -90.5, longitude: 0, material: []).valid?
    assert_not Requirement.new(latitude: 90.5, longitude: 0, material: []).valid?
    assert Requirement.new(latitude: 90, longitude: 0, material: ['foo']).valid?
  end

  test 'should have longitude in strong boundaries' do
    assert_not Requirement.new(latitude: 0, longitude: -180.5, material: []).valid?
    assert_not Requirement.new(latitude: 0, longitude: 180.5, material: []).valid?
    assert Requirement.new(latitude: 0, longitude: 180, material: ['foo']).valid?
  end

  test 'should have material as array of strings' do
    assert_not Requirement.new(latitude: 0, longitude: 0, material: []).valid?
    assert_not Requirement.new(latitude: 0, longitude: 0, material: [1, 'foo']).valid?
    assert Requirement.new(latitude: 0, longitude: 180, material: %w[foo zoo]).valid?
  end
end
