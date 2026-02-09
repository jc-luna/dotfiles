#!/usr/bin/env -S julia -O0 --startup-file=no

import Pkg

if (size(ARGS)[1] < 1) error("mkjl requires a project name.") end

Pkg.generate(String(ARGS[1]))
