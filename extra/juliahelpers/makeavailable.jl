#!/usr/bin/env -S julia -O0 --startup-file=no

const DEPLOY_LOC = expanduser("~/.local/bin/")
const EXES = Dict(
	joinpath(@__DIR__, "mk.jl") => "mkjl",
	joinpath(@__DIR__, "jlstantiate.jl") => "jlstantiate"
)

function @main(ARGS)
	for (fname, newname) in pairs(EXES)
		cmder = `ln -sf $fname $(joinpath(DEPLOY_LOC, newname))`
		println(cmder)
		run(cmder)
	end
end
