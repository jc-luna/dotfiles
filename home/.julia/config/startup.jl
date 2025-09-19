using Pkg, Revise

atreplinit() do repl
	ENV["JULIA_EDITOR"] = "nvim"


	if (isfile("Project.toml") && isfile("Manifest.toml")) Pkg.activate(".") end
end
