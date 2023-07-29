require 'test/unit'
# require_relative '../src/script'
require 'yaml'

class ScriptTest < Test::Unit::TestCase

  def setup
    @content = YAML.load(File.read('docker-compose.yml'))
  end

  def test_docker_compose_file
    actual = File.file?('docker-compose.yml')
    assert(actual, 'In root folder should exists file with name \'docker-compose.yml\'')
  end

  def test_docker_file_ui
    actual = File.file?('ui/Dockerfile-dev')
    assert(actual, 'In \'ui\' folder should exists file with name \'Dockerfile-dev\'')
  end

  def test_docker_file_api
    actual = File.file?('api/Dockerfile-dev')
    assert(actual, 'In \'api\' folder should exists file with name \'Dockerfile-dev\'')
  end

  def test_ui_nodejs_version
    actual = false
    File.foreach("ui/Dockerfile-dev") do |line|
      if /FROM.*node:16/i =~ line
        actual = true
        break
      end
    end
    assert(actual, 'The image version of nodejs shuold be 16')
  end

  def test_ui_expose_port
    actual = false
    File.foreach("ui/Dockerfile-dev") do |line|
      if /EXPOSE.*4201/i =~ line
        actual = true
        break
      end
    end
    assert(actual, 'The ui container should listen port 4201')
  end

  def test_api_nodejs_version
    actual = false
    File.foreach("api/Dockerfile-dev") do |line|
      if /FROM.*node:16/i =~ line
        actual = true
        break
      end
    end
    assert(actual, 'The image version of nodejs should be 16')
  end

  def test_api_expose_port
    actual = false
    File.foreach("api/Dockerfile-dev") do |line|
      if /EXPOSE.*3080/i =~ line
        actual = true
        break
      end
    end
    assert(actual, 'The api container should listen port 3080')
  end

  def test_api_service_present
    actual = @content["services"]["nodejs-server"]
    assert_not_nil(actual, "Docker compose must contains service named nodejs-server")
  end

  def test_ui_service_present
    actual = @content["services"]["angular-ui"]
    assert_not_nil(actual, "Docker compose must contains service named angular-ui")
  end

  def test_api_dockerfile_present
    actual = @content["services"]["nodejs-server"]["build"]["dockerfile"]
    expected = 'Dockerfile-dev'
    assert_equal(expected, actual, "Name for docker file in nodejs-server should be #{expected}")
  end

  def test_ui_dockerfile_present
    actual = @content["services"]["angular-ui"]["build"]["dockerfile"]
    expected = 'Dockerfile-dev'
    assert_equal(expected, actual, "Name for docker file in angular-ui should be #{expected}")
  end

  def test_api_port_present
    actual = @content["services"]["nodejs-server"]["ports"]
    expected = ["3080:3080"]
    assert_equal(expected, actual, "Port for api should be equal to #{expected}")
  end

  def test_ui_port_present
    actual = @content["services"]["angular-ui"]["ports"]
    expected = ["4201:4201"]
    assert_equal(expected, actual, "Port for ui should be equal to #{expected}")
  end


end





