using Documenter, PiBBP

makedocs(
  # options
  modules = [PiBBP],
  doctest = false
)

deploydocs(
  deps   = Deps.pip("mkdocs", "pygments", "python-markdown-math"),
  repo   = "github.com/kalvotom/PiBBP.jl.git",
  julia  = "0.4",
  osname = "linux"
)
