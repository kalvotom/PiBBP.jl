using Documenter, PiBBP

makedocs(
  # options
  modules = [PiBBP]
)

deploydocs(
    deps   = Deps.pip("mkdocs", "python-markdown-math"),
    repo   = "github.com/kalvotom/PiBBP.jl.git",
    julia  = "0.4",
    osname = "linux"
)
