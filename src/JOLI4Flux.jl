module JOLI4Flux
    using JOLI: joAbstractLinearOperator
    using Tracker
    import Base.*
    import Tracker.@grad

    *(x::joAbstractLinearOperator,y::TrackedVector) = Tracker.track(*, x, y)

    @grad a::joAbstractLinearOperator * b::AbstractVecOrMat =
        Tracker.data(a)*Tracker.data(b), Δ -> (Δ * transpose(b), transpose(a) * Δ)

end
