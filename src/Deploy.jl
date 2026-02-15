using Pkg: activate; activate(joinpath(@__DIR__, ".."))

using Dotfiles

function @main(ARGS)
	parsed = ParseCLIArgs()
	action = parsed["action"]
	target = parsed["target"]
	subtarget = parsed["subtarget"]

	println("$action-ing on $target and $subtarget")
	lctarget = lowercase(target)

	if (action == "deploy")
		if (target == "fastfetch")
			DeployFetch(subtarget, true, true)
		elseif (target == "omp")
			DeployPrompt(subtarget, true, true)
		else
			stowTarget = StowTargets[lctarget]
			Deploy(stowTarget, true, true)
		end
	elseif (action == "clean")
		if (target == "fastfetch")
			CleanFetch(subtarget, true)
		elseif (target == "omp")
			CleanPrompt(subtarget, true)
		elseif (target == "all")
			for (name, tgt) in pairs(StowTargets)
				Clean(tgt, true)
			end
		else
			stowTarget = StowTargets[lctarget]
			Clean(stowTarget, true)
		end
	end

	return 0
end
