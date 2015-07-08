require 'rexml/document'
require 'open3'

class CoveredPublisher < Jenkins::Tasks::Publisher
    module STATE
        IDLE    = 0
        LINE    = 1
        TOGGLE  = 2
        COMBI   = 3
        STATE   = 4
        MODULE  = 10
    end

    module TYPE
        LINE    = 0
        TOGGLE  = 1
        COMBI   = 2
        STATE   = 3
        RACE    = 4
        ASSERT  = 5
        MEMORY  = 6
    end


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
    end

    # @param [Jenkins::Model::Build] build on which to run this step
    # @param [Jenkins::Launcher] launcher the launcher that can run code on the node running this build
    # @param [Jenkins::Model::Listener] listener the listener for this build.
    def perform(build, launcher, listener)
        listener << "CDD File : %s" % @cdd_file
        listener << "XML File : %s" % @xml_file
        begin
            launcher.execute("bash","-c","covered report -d v -m lc -c #{@cdd_file}",{out:listener})
        rescue
            build.abort
        end
    end
end
