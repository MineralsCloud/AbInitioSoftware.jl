using CrystallographyBase: Cell

export Parameters

abstract type Parameters end

abstract type SystemParameters <: Parameters end
struct CrystalStructure <: SystemParameters
    cell::Cell
end
struct Pseudopotential <: SystemParameters
    potential::String
end
struct Cutoff <: SystemParameters
    energy::Float64
    density::Float64
    fock::Float64
end
struct FftMesh <: SystemParameters
    x::Int64
    y::Int64
    z::Int64
end
abstract type Smearing{T} <: SystemParameters end
struct Gaussian{T} <: Smearing{T}
    degauss::T
end
struct MethfesselPaxton{T} <: Smearing{T}
    degauss::T
end
struct MarzariVanderbilt{T} <: Smearing{T}
    degauss::T
end
struct FermiDirac{T} <: Smearing{T}
    degauss::T
end
abstract type KPoints <: SystemParameters end
struct GammaPoint <: KPoints end
struct MonkhorstPackGrid <: KPoints
    mesh
    shift
end
struct SpecialPoints <: KPoints end

abstract type ControlParameters <: Parameters end
abstract type ConvergenceThreshold{T} <: ControlParameters end
struct TotalEnergyThreshold{T} <: ConvergenceThreshold{T}
    value::T
end
struct ForcesThreshold{T} <: ConvergenceThreshold{T}
    value::T
end
struct EnergyErrorThreshold{T} <: ConvergenceThreshold{T}
    value::T
end
struct IterativeDiagonalizationThreshold{T} <: ConvergenceThreshold{T}
    value::T
end
abstract type MixingMode <: ControlParameters end
struct Broyden <: MixingMode end
struct WithThomasFermiScreening <: MixingMode end
struct WithLocalThomasFermiScreening <: MixingMode end
struct MixingFactor <: ControlParameters
    beta::Float64
end
abstract type DiagonalizationAlgorithm <: ControlParameters end
struct Davidson <: DiagonalizationAlgorithm end
struct ConjugateGradient <: DiagonalizationAlgorithm end
struct PPCG <: DiagonalizationAlgorithm end
struct ParO <: DiagonalizationAlgorithm end
struct RmmDavidson <: DiagonalizationAlgorithm end
struct RmmParO <: DiagonalizationAlgorithm end
abstract type IonDynamics <: ControlParameters end
abstract type Relaxation <: IonDynamics end
struct BFGS <: Relaxation end
struct QuickMinVerlet <: Relaxation end
struct FIRE <: Relaxation end
abstract type MolecularDynamics end
struct Verlet <: MolecularDynamics end
struct Langevin <: MolecularDynamics end
struct LangevinSmartMonteCarlo <: MolecularDynamics end

struct System
    parameters::Vector{SystemParameters}
end
