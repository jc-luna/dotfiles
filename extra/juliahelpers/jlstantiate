#!/usr/bin/env -S julia -O0 --startup-file=no

using Pkg

if (size(ARGS)[1] < 1)
	Pkg.activate(".")
	Pkg.instantiate()
else
	Pkg.activate(ARGS[1])
	Pkg.instantiate()
end
