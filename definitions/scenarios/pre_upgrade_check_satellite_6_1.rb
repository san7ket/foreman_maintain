class Scenarios::PreUpgradeCheckSatellite_6_1 < ForemanMaintain::Scenario
  tags :pre_upgrade_check, :satellite_6_1
  description 'checks before upgrading to Satellite 6.1'
  confine do
    feature(:downstream) && feature(:downstream).current_version.to_s.start_with?('6.0.')
  end

  def compose
    steps.concat(find_checks(:basic))
    steps.concat(find_checks(:pre_upgrade))
  end
end
