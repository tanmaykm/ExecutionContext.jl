using Distributed
addprocs(3)

@everywhere begin
    using Distributed
    using ExecutionContext
end

ExecutionContext.exmplctx[] = 3

@everywhere begin
    dc = ExecutionContext.DistributedContext()
    push!(dc.contextvars, ExecutionContext.exmplctx)
    Distributed.set_distributed_context(dc)
end

@everywhere println("hello")

@everywhere println("hello", ExecutionContext.exmplctx[])

