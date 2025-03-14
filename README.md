# AgentBasedFightClub

This repo hosts code for a Gladitorial death match between agents who compete in a brutal game of go fish.

# Leader Board

As a common reference point, each agent is compared to a `Guesser` agent which randomly guesses. 

## Agent vs. Random Guesser

| Rank | Name  | Score      |
|------|-------|------------|
| 1    | Chris | 711 / 1000 |

# Installation

Install the latest version of [Julia](https://julialang.org/downloads/).

You may optionally install the [VSCode IDE](https://code.visualstudio.com/) with the [Julia plugin](https://code.visualstudio.com/docs/languages/julia).

First, create a fork of this repo, and install it on your computer by typing the following into the Julia REPL:

```julia 
] dev url_to_your_fork
```
This will install a development copy in `.julia/dev` where you can create your agent. 

# Organization

The folder `src` contains a template associated with your name where you can write your code. A simple example can be found in `src/example.jl`. An example for running the Gladetorial death match can be found in `sandbox/run_example.jl`. For the purpose of testing and development, you can make a copy of `run_example.jl` and modify it as needed for your purposes. 

# Submitting your Agent

As you work on your agent, you can commit changes to your fork optionally from the Julia REPL. Simply type `]` to switch to the terminal mode and use git commands as usual. Once you are ready to submit your agent, submit a pull request to the originating repo. 

# Additional Information

More information for go fish can be found in the README of [GoFish.jl](https://github.com/itsdfish/GoFish.jl)

# Example

See `src/guesser.jl` for a simple example of a custom agent which guesses. To run a battle against the Guesser agent, copy and modify `agent_vs_guesser_battles/run_battle_chris_vs_guesser.jl`.  



