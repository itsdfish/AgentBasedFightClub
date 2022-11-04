module AgentBasedFightClub
    using GoFish
    import GoFish: process_exchange!
    import GoFish: process_go_fish!
    import GoFish: process_books! 
    import GoFish: decide
    export Chris
    export Dad 
    export Taylor 
    export Mary
    export Example
    export battle!

    include("dad.jl")
    include("chris.jl")
    include("taylor.jl")
    include("mary.jl")
    include("example.jl")
    include("utilities.jl")
end
