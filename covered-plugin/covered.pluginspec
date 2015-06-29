Jenkins::Plugin::Specification.new do |plugin|
  plugin.name = "covered"
  plugin.display_name = "Covered Plugin"
  plugin.version = '0.0.1'
  plugin.description = 'Verilog code coverage analysis tool Covered log converter'

  # You should create a wiki-page for your plugin when you publish it, see
  # https://wiki.jenkins-ci.org/display/JENKINS/Hosting+Plugins#HostingPlugins-AddingaWikipage
  # This line makes sure it's listed in your POM.
  plugin.url = 'https://wiki.jenkins-ci.org/display/JENKINS/Covered+Plugin'

  # The first argument is your user name for jenkins-ci.org.
  plugin.developed_by "morittyo", "MoriLab. <morittyo@gmail.com>"

  # This specifies where your code is hosted.
  # Alternatives include:
  #  :github => 'myuser/covered-plugin' (without myuser it defaults to jenkinsci)
  #  :git => 'git://repo.or.cz/covered-plugin.git'
  #  :svn => 'https://svn.jenkins-ci.org/trunk/hudson/plugins/covered-plugin'
  plugin.uses_repository :github => "covered-plugin"

  # This is a required dependency for every ruby plugin.
  plugin.depends_on 'ruby-runtime', '0.10'

  # This is a sample dependency for a Jenkins plugin, 'git'.
  #plugin.depends_on 'git', '1.1.11'
end
