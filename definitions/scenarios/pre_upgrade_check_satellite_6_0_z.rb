class Scenarios::PreUpgradeCheckSatellite_6_0_z < ForemanMaintain::Scenario
  tags :pre_upgrade_check, :satellite_6_0_z
  description 'checks before upgrading to Satellite 6.0'
  confine do
    feature(:downstream) && feature(:downstream).current_version.to_s.start_with?('6.0.')
  end

  def compose
    steps.concat(find_checks(:basic))
    steps.concat(find_checks(:pre_upgrade))
  end
end
