project(user)

include_directories(
	${OPENSSL_INCLUDE_DIR}
	${Boost_INCLUDE_DIR}
	${CMAKE_SOURCE_DIR}/src/
)
link_directories(${Boost_LIBRARY_DIR_RELEASE})

add_executable(${PROJECT_NAME} user.cpp)

target_link_libraries(${PROJECT_NAME}
	lib
	${OpenSSL_LIBRARIES}
	${ADDITIONAL_LIBS}
)
