cmake_minimum_required(VERSION 3.14)

project(To_Do_List VERSION 0.1 LANGUAGES CXX)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/$<CONFIG>")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/$<CONFIG>")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin/$<CONFIG>")

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Core Quick Qml Gui REQUIRED)

set(PROJECT_SOURCES
	include/to-do-list/task.h
	src/to-do-list/task.cpp
	include/to-do-list/taskmodel.h
	src/to-do-list/taskmodel.cpp
	include/to-do-list/sortedtasks.h
	src/to-do-list/sortedtasks.cpp
	src/to-do-list/main.cpp
	resources/qml/qml.qrc
	resources/icons/icons.qrc
)

add_executable(To_Do_List ${PROJECT_SOURCES})

target_compile_definitions(To_Do_List
	PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(To_Do_List
	PRIVATE
		Qt6::Core
		Qt6::Quick
		Qt6::Qml
		Qt6::Gui
	)

target_include_directories(To_Do_List
	PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
