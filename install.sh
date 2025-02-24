compiler=$1

git clone https://github.com/catchorg/Catch2 ../Catch2
cmake -S ../Catch2 -B ../build-Catch2 \
  -DCMAKE_INSTALL_PREFIX=../build-Catch2/install/
cmake --build ../build-Catch2 -j8 --target install

export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:../build-Catch2/install

cmake . -B ../build-class \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_CXX_COMPILER=$compiler
cmake --build ../build-class -j8