defmodule Mix.Tasks.Generate do

  @moduledoc """
  Mix tasks for generating different web project templates
  """

  @root File.cwd |> elem(1)

  def run([]) do
    Mix.shell.info """
      Execute Mix.Tasks.Generate with any parameters.

      Example:

      mix generate --grunt
      """
  end

  def run(["commands"]) do
    Mix.shell.info """
      Available commands:

        --grunt - create new weber project with grunt.
    """
  end

  def run([project_dir | command]) do
    Mix.Tasks.Weber.New.run([project_dir])

    Enum.each(command, 
        fn(addition) -> 
          case addition do
            "--grunt" -> add_grunt(project_dir)
            _ -> :wrong
          end
        end)
  end

  defp add_grunt(project_dir) do
    basename = Path.basename(project_dir)
    Mix.Generator.create_file Path.absname(project_dir) <> <<"/package.json">>, (Grunt.package_json basename)
    Mix.Generator.create_file Path.absname(project_dir) <> <<"/Gruntfile.js">>, (Grunt.gruntfile)
  end

end
