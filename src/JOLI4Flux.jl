module JOLI4Flux
    using JOLI: joAbstractLinearOperator
    using Zygote
    import Base.*
    using Zygote: @adjoint
    
    @adjoint a::joAbstractLinearOperator * b::AbstractVecOrMat = 
        *(a, b), Δ -> (nothing, transpose(a) * Δ)
end