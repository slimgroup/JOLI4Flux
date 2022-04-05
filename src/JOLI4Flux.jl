module JOLI4Flux

    using JOLI: joAbstractLinearOperator
    using ChainRulesCore, FillArrays
    import Base.*
    
    function ChainRulesCore.rrule(::typeof(*), A::joAbstractLinearOperator{ADDT,ARDT}, v) where {ADDT,ARDT}
      Y = A*v
      function time_pullback(dy)
        DY = unthunk(dy)
        return NoTangent(), NoTangent(), @thunk(A' * DY)
      end
      return Y, time_pullback
    end

    function *(A::joAbstractLinearOperator{ADDT,ARDT}, v::FillArrays.Fill{vDT,1}) where {ADDT,ARDT,vDT<:Number}
        A*Vector(v)
    end

end

