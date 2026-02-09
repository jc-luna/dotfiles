module Dotfiles

using ArgParse

export DOTFILES_ROOT
export ParseCLIArgs
export DeployCommand, CleanCommand
export Deploy, Clean
export StowTarget, StowTargets

const DOTFILES_ROOT = joinpath(@__DIR__, "..")

struct StowTarget
	Target
	To
end

StowTargets = Dict(
"home" => StowTarget(
	abspath(joinpath(DOTFILES_ROOT, "home")),
	abspath(joinpath(DOTFILES_ROOT, expanduser("~")))),
"bash" => StowTarget(
	abspath(joinpath(DOTFILES_ROOT, "shell", "bash")),
	abspath(joinpath(DOTFILES_ROOT, expanduser("~")))),
"zsh" => StowTarget(
	abspath(joinpath(DOTFILES_ROOT, "shell", "zsh")),
	abspath(expanduser("~"))),
"fastfetch" => StowTarget(
	abspath(joinpath(DOTFILES_ROOT, "fastfetch")),
	abspath(expanduser(joinpath("~/.config/fastfetch"))))
)

function DeployCommand(stowTarget, forceful=false)
	wheredir = dirname(stowTarget.Target)
	whichone = basename(stowTarget.Target)
	todir = stowTarget.To
	action = (forceful) ? "--adopt" : "--restow"

	return `stow --verbose --target=$todir --dir=$wheredir $action $whichone`
end

function Deploy(stowTarget, verbose=false, forceful=false)
	commander = DeployCommand(stowTarget, forceful)
	if (verbose) println(commander) end
	run(commander)
end

function CleanCommand(stowTarget, verbose=false)
	wheredir = dirname(stowTarget.Target)
	whichone = basename(stowTarget.Target)
	todir = stowTarget.To

	return `stow --verbose --target=$todir --dir=$wheredir --delete $whichone`
end

function Clean(stowTarget, verbose=false)
	commander = CleanCommand(stowTarget, verbose)
	if (verbose) println(commander) end
	run(commander)
end

function ParseCLIArgs()
	argsettings = ArgParseSettings()
	argsettings.prog = "./deploy"
	argsettings.description = "Luna Dotfiles Deploy Script"

	@add_arg_table! argsettings begin
		"action"
			help = "One of: deploy, clean, or interactive"
			required = true
		"target"
			help = "A dotfiles deploy target."
				#\t- zsh: .zshrc and more
				#\t- bash: .bashrc and more
				#\t- fetch: Fastfetch config
				#\t- home: Stuff not associated with the categories above
				#\t- all: Everything
			required = true
		"subtarget"
			help = "A subtarget."
			required = false
	end

	return parse_args(argsettings)
end

end # module Dotfiles
