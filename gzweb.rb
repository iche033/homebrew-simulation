require 'formula'

class gzweb < Formula
  homepage 'http://gazebosim.org'
  head 'https://bitbucket.org/osrf/gzweb', :branch => 'osx', :using => :hg

  depends_on 'cmake'  => :build
  depends_on 'pkg-config' => :build

  depends_on 'boost'
  depends_on 'gazebo'
  depends_on 'node'
  depends_on 'gts'
  depends_on 'imagemagick'
  depends_on 'jansson'
  depends_on 'tinyxml'

  def install
    ENV.m64

    ./deploy.sh -m
    #cmake_args = std_cmake_args.select { |arg| arg.match(/CMAKE_BUILD_TYPE/).nil? }
    #cmake_args << "-DCMAKE_BUILD_TYPE=Release"

    #mkdir "build" do
    #  system "cmake", "..", *cmake_args
    #  system "make install"
    #end
  end
end
