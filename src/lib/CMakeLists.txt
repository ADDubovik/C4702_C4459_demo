project(lib)

set(SRC
	lib.cpp
	lib.h
)

include_directories(
	${OPENSSL_INCLUDE_DIR}
	${Boost_INCLUDE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}
)

add_library(${PROJECT_NAME} ${SRC})
