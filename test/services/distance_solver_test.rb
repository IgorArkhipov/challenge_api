# frozen_string_literal: true

require 'test_helper'

class DistanceSolverTest < ActiveSupport::TestCase
  test 'return nil when attributes are missing for haversine calculation' do
    assert_nil DistanceSolver.haversine_calculation(start_lat: 0, start_long: 1, target_lat: 2, target_long: nil)
  end

  test 'return nil when attributes are missing for simplified calculation' do
    assert_nil DistanceSolver.simple_calculation(start_lat: 0, start_long: 1, target_lat: 2, target_long: nil)
  end

  test 'calculate haversine metric distance for provided lat and long attrs' do
    assert_equal(
      111.17799068882648,
      DistanceSolver.haversine_calculation(start_lat: 1, start_long: 1, target_lat: 1, target_long: 2)
    )
  end

  test 'calculate simplified metric distance for provided lat and long attrs' do
    assert_equal(
      110.98309416235944,
      DistanceSolver.simple_calculation(start_lat: 1, start_long: 1, target_lat: 1, target_long: 2)
    )
  end
end
