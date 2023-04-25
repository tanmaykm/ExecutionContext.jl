import Distributed: AbstractDistributedContext,
    get_context_vars,
    with_context_vars,
    run_work_thunk


mutable struct DistributedContext <: AbstractDistributedContext
    # the set of context vars to consider for distributed context
    contextvars::Set{ContextVar}

    function DistributedContext()
        return new(Set{ContextVar}())
    end
end

function get_context_vars(dc::DistributedContext)
    return Pair{ContextVar,Any}[cv => get(cv) for cv in dc.contextvars if !isnothing(get(cv))]
end

function set_context_vars(dc::DistributedContext, vars::Vector{Pair{ContextVar,Any}})
    for (cv, val) in vars
        if cv in dc.contextvars
            setindex!(cv, val)
        end
    end
end

function with_context_vars(f::Function, dc::DistributedContext, vars::Vector{Pair{ContextVar,Any}})
    oldvars = get_context_vars(dc)
    try
        set_context_vars(dc, vars)
        return f()
    finally
        set_context_vars(dc, oldvars)
    end
end