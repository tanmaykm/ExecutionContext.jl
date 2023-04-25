module ExecutionContext

using UUIDs
using Random

import Base: get, getindex, setindex!, delete!, show, eltype, PkgId

include("contextvariables.jl")
include("distributedcontext.jl")

@contextvar exmplctx

export ContextVar, set!, @contextvar, reset_context, set_context, snapshot_context, with_context

end # module ExecutionContext
