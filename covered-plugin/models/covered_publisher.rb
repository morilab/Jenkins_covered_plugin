require 'rexml/document'
require 'open3'
require_relative 'cov2xml'

class CoveredPublisher < Jenkins::Tasks::Publisher

    display_name "Covered publisher"
    
    attr_accessor :cdd_file
    attr_accessor :xml_file

    def initialize(attrs = {})
        @cdd_file = attrs['cdd_file'].strip
        @xml_file = attrs['xml_file'].strip
    end

    # @param [Jenkins::Model::Build] build the build which will begin
    # @param [Jenkins::Model::Listener] listener the listener for this build.
    def prebuild(build, listener)
	cov2xml = Cov2xml.new
	cov2xml.cdd_file = @cdd_file
	cov2xml.xml_file = @xml_file
	cov2xml.exec
    end

    # @param [Jenkins::Model::Build] build on which to run this step
    # @param [Jenkins::Launcher] launcher the launcher that can run code on the node running this build
    # @param [Jenkins::Model::Listener] listener the listener for this build.
    def perform(build, launcher, listener)
        listener << "CDD File : %s" % @cdd_file
        listener << "XML File : %s" % @xml_file
    end
end
