defmodule Grunt do

  def package_json(basename) do
    """
    {
      "name": "#{basename}",
      "version": "0.0.1",
      "devDependencies": {
      "grunt": "~0.4.2"
      }
    }
    """
  end
 
  def gruntfile do
    """
    module.exports = function(grunt) {
      grunt.initConfig({
        pkg: grunt.file.readJSON('package.json')
      });
    };
    """
  end
  
end
