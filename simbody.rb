require 'formula'

class Simbody < Formula
  homepage 'https://simtk.org/home/simbody'
  url 'https://github.com/simbody/simbody/archive/Simbody-3.3.zip'
  sha1 'a67ee802fb410a1c346718a48ac0ede2f7fa56ea'
  head 'https://github.com/simbody/simbody.git', :branch => 'master'

  depends_on 'cmake' => :build

  # fix install location of cmake config files
  def patches; DATA unless build.head?; end

  def install
    ENV.m64

    cmake_args = [
      "-DSimTK_INSTALL_PREFIX='#{prefix}'",
    ]
    cmake_args.concat(std_cmake_args)
    cmake_args << ".."

    mkdir "build" do
      system "cmake", *cmake_args
      system "make", "doxygen" if build.head?
      system "make", "install"
    end
  end

end

__END__
diff --git a/CMakeLists.txt b/CMakeLists.txt
index 8968e2f..0a9b1b1 100644
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -557,4 +557,5 @@ FILE(GLOB TOPLEVEL_DOCS doc/*.pdf doc/*.txt)
 INSTALL(FILES ${TOPLEVEL_DOCS} DESTINATION doc)

 FILE(GLOB INSTALLED_CMAKE_STUFF cmake/*.cmake cmake/*.txt)
-INSTALL(FILES ${INSTALLED_CMAKE_STUFF} DESTINATION share/cmake)
+INSTALL(FILES ${INSTALLED_CMAKE_STUFF} DESTINATION share/Simbody/cmake)
+INSTALL(FILES cmake/FindSimbody.cmake DESTINATION share/Simbody/cmake/ RENAME SimbodyConfig.cmake)