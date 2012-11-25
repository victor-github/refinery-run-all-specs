refinery-run-all-specs
======================

Runs all specs, including the engine (extensions) specs in vendor/extensions

You can use this in any app that uses Rails Engines, by modifying the line that adds the Refinery-specific module namespacing:
  extensions << (eval "Refinery::#{e.camelcase}") unless (e == "." || e == "..")

Please note the following setup is required if Refinery is used with Devise, in order for rspec to work:
http://stackoverflow.com/questions/10666365/how-to-login-a-user-in-refinerycms-tests/11926783#11926783
