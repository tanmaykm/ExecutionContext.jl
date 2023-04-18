module ExecutionContext

using UUIDs
using Random

import Base: get, getindex, setindex!, delete!, show, eltype

include("contextvariables.jl")

export ContextVar, set!, @contextvar, reset_context, set_context, snapshot_context, with_context

end # module ExecutionContext
