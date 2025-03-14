module AgentBasedFightClub
    using GoFish
    import GoFish: process_exchange!
    import GoFish: process_go_fish!
    import GoFish: process_books! 
    import GoFish: setup!
    import GoFish: decide

    export Chris
    export Dad 
    export DFish
    export Guesser
    export Mary
    export Papi

    export battle!
    export guess

    include("dad.jl")
    include("chris.jl")
    include("guesser.jl")
    include("dfish.jl")
    include("mary.jl")
    include("papi.jl")
    include("utilities.jl")
end
