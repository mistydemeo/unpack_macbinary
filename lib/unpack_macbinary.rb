# typed: strict
require "unpack_macbinary/version"

require "fileutils"

require "sorbet-runtime"

module MacBinary
  extend T::Sig

  class MacunpackException < StandardError; end

  sig {params(macbinary: String, target_dir: String).returns(T::Hash[Symbol, String])}
  def self.unpack macbinary, target_dir=Dir.pwd
    # macunpack always unpacks into the working directory
    FileUtils.cd target_dir do
      # macunpack will sanitize the source filename if it contains spaces
      sanitized = File.basename(macbinary.gsub(" ", "_"), ".bin")

      # -3 extracts data and resource forks even if they're empty
      if !system "macunpack", "-3", macbinary
        raise MacunpackException, "macunpack returned non-zero exit status"
      end

      output_files = {
        data: "#{target_dir}/#{sanitized}.data",
        info: "#{target_dir}/#{sanitized}.info",
        rsrc: "#{target_dir}/#{sanitized}.rsrc"
      }

      raise MacunpackException, "macunpack did not generate a data fork" unless File.exist? output_files[:data]
      raise MacunpackException, "macunpack did not generate a data fork" unless File.exist? output_files[:rsrc]

      return output_files
    end
  end

  sig {params(data_fork: String, resource_fork: String).void}
  def self.add_resource_fork data_fork, resource_fork
    FileUtils.cp resource_fork, "#{data_fork}/..namedfork/rsrc"
  end
end
