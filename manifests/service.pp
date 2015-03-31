class auditd::service {
  service { 'auditd':
    name => 'auditd',
    ensure => 'running',
    enable => 'true',
  }
}
