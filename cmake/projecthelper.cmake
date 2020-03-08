
macro(SETUP_COMPILER_SETTINGS)

	string(REPLACE ";" " " cmake_cl_release_init_str "${ADDITIONAL_CL_OPTIMIZATION_OPTIONS} /D NDEBUG /EHsc /W4 /Ox /Ot /GF /Gy /Qpar /GR /FR ")
	#string(REPLACE ";" " " cmake_cl_release_init_str "${ADDITIONAL_CL_OPTIMIZATION_OPTIONS} /D NDEBUG /EHsc /W4 /Ox /Ot /GL /GF /Gy /Qpar /GR /FR ")
	#string(REPLACE ";" " " cmake_linker_release_init_str "${ADDITIONAL_LINKER_OPTIMIZATION_OPTIONS} /opt:ref /DEBUG /INCREMENTAL:NO /LTCG")
	string(REPLACE ";" " " cmake_linker_release_init_str "${ADDITIONAL_LINKER_OPTIMIZATION_OPTIONS} /opt:ref /DEBUG /INCREMENTAL:NO")
	string(REPLACE ";" " " cmake_librarian_release_init_str "${ADDITIONAL_LINKER_OPTIMIZATION_OPTIONS} /LTCG")

		if(WIN32)
			set(CMAKE_CXX_FLAGS_DEBUG "/MTd /D_DEBUG /Zi /Ob0 /Od /RTC1 /permissive-")
			set(CMAKE_CXX_FLAGS_RELEASE "/MT /O2 ${cmake_cl_release_init_str} /permissive-")
			set(CMAKE_CXX_FLAGS_MINSIZEREL "/MT /O1 ${cmake_cl_release_init_str} /permissive-")
			set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "/MT /O2 /Zi ${cmake_cl_release_init_str} /permissive-")

			set(CMAKE_C_FLAGS "/DWIN32 /D_WINDOWS /W3 /permissive-")
			set(CMAKE_C_FLAGS_DEBUG "/MTd /Zi /Ob0 /Od /RTC1 /permissive-")
			set(CMAKE_C_FLAGS_RELEASE "/MT /O2 /Ob2 /DNDEBUG /permissive-")
			set(CMAKE_C_FLAGS_MINSIZEREL "/MT /O1 /Ob1 /DNDEBUG /permissive-")
			set(CMAKE_C_FLAGS_RELWITHDEBINFO "/MT /Zi /O2 /Ob1 /DNDEBUG /permissive-")

			set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${cmake_linker_release_init_str}")
			set(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "${cmake_linker_release_init_str}")
			set(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "${cmake_linker_release_init_str}")

			set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "${cmake_librarian_release_init_str}")
			set(CMAKE_STATIC_LINKER_FLAGS_MINSIZEREL "${cmake_librarian_release_init_str}")
			set(CMAKE_STATIC_LINKER_FLAGS_RELWITHDEBINFO "${cmake_librarian_release_init_str}")
		endif(WIN32)

endmacro(SETUP_COMPILER_SETTINGS)
