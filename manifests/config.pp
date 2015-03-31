class auditd::config {
  file { 'auditd.conf':
    path   => '/etc/audit/auditd.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0640',
    source => 'puppet:///modules/auditd/auditd.conf',
  }

  $stig = $::operatingsystemmajrelease ? {
    '5' => 'puppet:///modules/auditd/el5_stig.rules',
    '6' => 'puppet:///modules/auditd/el6_stig.rules',
    '7' => 'puppet:///modules/auditd/el7_stig.rules',
  }
  file {'audit.rules':
    path => '/etc/audit/audit.rules',
    owner => 'root',
    group => 'root',
    mode => '0640',
    source => $stig,
  }
}
