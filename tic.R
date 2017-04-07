get_stage("after_success") %>%
  add_step(step_hello_world()) %>%
  add_step(step_run_covr())

get_stage("deploy") %>%
  add_step(step_install_ssh_keys()) %>%
  add_step(step_test_ssh())
