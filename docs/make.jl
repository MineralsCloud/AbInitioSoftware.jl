using AbInitioSoftware
using Documenter

DocMeta.setdocmeta!(AbInitioSoftware, :DocTestSetup, :(using AbInitioSoftware); recursive=true)

makedocs(;
    modules=[AbInitioSoftware],
    authors="singularitti <singularitti@outlook.com> and contributors",
    repo="https://github.com/MineralsCloud/AbInitioSoftware.jl/blob/{commit}{path}#{line}",
    sitename="AbInitioSoftware.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://MineralsCloud.github.io/AbInitioSoftware.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/MineralsCloud/AbInitioSoftware.jl",
    devbranch="main",
)
