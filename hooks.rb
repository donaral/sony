Around do
  dismiss_alert
  end

  def dismiss_alert
    if  page.has_css?('.fsrFloatingMid').page.has_css?('.fsrDeclineButton')
      page.driver.browser.switch_to.alert.dismiss
    end
  end
#  page.evaluate_script('window.confirm = function() { return false; }')