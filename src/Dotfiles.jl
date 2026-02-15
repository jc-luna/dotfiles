module Dotfiles

using ArgParse

export DOTFILES_ROOT
export ParseCLIArgs
export DeployCommand, CleanCommand
export Deploy, Clean
export DeployFetch, CleanFetch
export StowTarget, StowTargets

const DOTFILES_ROOT = joinpath(@__DIR__, "..")
const HOME_DOTFILES = joinpath(DOTFILES_ROOT, "home")
const SHELL_DOTFILES = joinpath(DOTFILES_ROOT, "shell")
const AESTHETIC_DOTFILES = joinpath(DOTFILES_ROOT, "aesthetic")

struct StowTarget
	Target
	To
end

StowTargets = Dict(
	"config" => StowTarget(
		abspath(joinpath(HOME_DOTFILES, "config")),
		abspath(joinpath(expanduser("~/.config")))),
	"home" => StowTarget(
		abspath(joinpath(HOME_DOTFILES, "root")),
		abspath(joinpath(expanduser("~")))),
	"bash" => StowTarget(
		abspath(joinpath(SHELL_DOTFILES, "bash")),
		abspath(joinpath(expanduser("~")))),
	"zsh" => StowTarget(
		abspath(joinpath(SHELL_DOTFILES, "zsh")),
		abspath(expanduser("~"))),
	"rcextras" => StowTarget(
		abspath(joinpath(SHELL_DOTFILES, "rcextras")),
		abspath(expanduser("~/.rcextras"))),
	"julia" => StowTarget(
		abspath(joinpath(DOTFILES_ROOT, "home", "julia")),
		abspath(expanduser("~/.julia/config"))),
)

Fetches = Dict(
	"archdefault" => StowTarget(
		abspath(joinpath(DOTFILES_ROOT, "aesthetic", "fetch", "archdefault")),
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
	mkpath(stowTarget.To)
	commander = DeployCommand(stowTarget, forceful)
	if (verbose) println(commander) end
	run(commander)
end

function DeployFetch(fetchName, verbose=false, forceful=false)
	stowTarget = Fetches[fetchName]
	mkpath(stowTarget.To)
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

function CleanFetch(fetchName, verbose=false)
	stowTarget = Fetches[fetchName]
	mkpath(stowTarget.To)
	commander = CleanFetch(stowTarget, verbose)
	if (verbose) println(commander) end
	run(commander)
end

function ParseCLIArgs()
	argsettings = ArgParseSettings()
	argsettings.prog = "./deploy"
	argsettings.description = "Luna Dotfiles Management Script"

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
