module JOLI4Flux

    using JOLI: joAbstractLinearOperator
    using Zygote
    using FillArrays
    import Base.*
    using Zygote: @adjoint

    @adjoint a::joAbstractLinearOperator * b::AbstractVecOrMat =
        *(a, b), Δ -> (nothing, transpose(a) * Δ)

    function *(
        A::joAbstractLinearOperator{ADDT,ARDT},
        v::FillArrays.Fill{vDT,1}
    ) where {ADDT,ARDT,vDT<:Number}

        dummy = Vector(v)
        res = A*dummy

    end


end

