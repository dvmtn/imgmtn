defmodule Mix.Tasks.Phantomjs.Start do
  use Mix.Task

  @shortdoc "Run PhantomJS ready for integration tests"

  def run(_) do
    System.cmd("phantomjs", [ "--wd" ], into: IO.stream(:stdio, :line))
  end
end
