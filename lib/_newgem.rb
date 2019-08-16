module NewGem
  class << self
    def version
      '0.4.2'
    end

    def description
      name.to_s
    end

    def dependencies
      {
       #'main'    => [ 'main'    , '~> 6.2', '>= 6.2.3' ],
       #'map'     => [ 'map'     , '~> 6.6' ],
       #'chronic' => [ 'chronic' , '~> 0.10' ],
      }
    end

    def stdlibs
      [
       #'yaml',
       #'yaml/store',
       #'time',
       #'date',
       #'pathname',
       #'tempfile',
       #'fileutils',
       #'enumerator'
      ]
    end

    def libs
      [
      ]
    end

    def libdir(*args, &block)
      @libdir ||= (
        path = File.expand_path(__FILE__)
        dirname = File.dirname(path)
        basename = File.basename(path)

        basename.sub!(/^_/,'')
        basename.sub!(/\.rb$/,'')

        File.join(dirname, basename)
      )
      args.empty? ? @libdir : File.join(@libdir, *args)
    ensure
      if block
        begin
          $LOAD_PATH.unshift(@libdir)
          block.call()
        ensure
          $LOAD_PATH.shift()
        end
      end
    end

    def load(*libs)
      libs = libs.join(' ').scan(/[^\s+]+/)
      libdir{ libs.each{|lib| Kernel.load(lib) } }
    end

    def require_all!
      stdlibs.each do |lib|
        require(lib)
      end

      require 'rubygems'

      dependencies.each do |lib, dependency|
        gem(*dependency)
        require(lib)
      end

      libs.each do |lib|
        libdir{ require(lib) }
      end
    end
  end
end
