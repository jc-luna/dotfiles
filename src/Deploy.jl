using Pkg: activate; Pkg.activate(joinpath(@__DIR__, ".."))

using Dotfiles

function @main(ARGS)
	parsed = ParseCLIArgs()
	action = parsed["action"]
	target = parsed["target"]
	subtarget = parsed["subtarget"]

	println("$action-ing on $target and $subtarget")

	lctarget = lowercase(target)
	stowTarget = StowTargets[lctarget]

	if (action == "deploy")
		Deploy(stowTarget, true, true)
	elseif (action == "clean")
		Clean(stowTarget, true)
	end

	return 0
end
