require 'formula'

class Gzweb < Formula
    homepage 'http://gazebosim.org'
    url 'http://bitbucket.org/osrf/gzweb/get/be8ca0f.tar.bz2'
    sha1 'f532f43dc96a862846f4933726c84160fa5c2b8b'
    head 'https://bitbucket.org/osrf/gzweb', :branch => 'osx', :using => :hg
    version '1.2.0'

    depends_on 'cmake'  => :build
    depends_on 'pkg-config' => :build

    depends_on 'boost'
    depends_on 'gazebo'
    depends_on 'gts'
    depends_on 'imagemagick'
    depends_on 'jansson'
    depends_on 'tinyxml'

    def install
        ENV.m64

        system "./deploy.sh", " -m"
        #cmake_args = std_cmake_args.select { |arg| arg.match(/CMAKE_BUILD_TYPE/).nil? }
        #cmake_args << "-DCMAKE_BUILD_TYPE=Release"

        #mkdir "build" do
        #  system "cmake", "..", *cmake_args
        #  system "make install"
        #end
    end
end
