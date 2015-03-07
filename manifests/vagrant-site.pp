node default {
  include jenkins
  include ci_example
  include git_example

  Class['jenkins'] -> Class['ci_example']
}
