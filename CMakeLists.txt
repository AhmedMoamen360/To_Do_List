cmake_minimum_required(VERSION 3.14)

project(To_Do_List VERSION 0.1 LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(QT NAMES Qt6 COMPONENTS Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick REQUIRED)

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

qt_add_executable(To_Do_List
    MANUAL_FINALIZATION
    ${PROJECT_SOURCES}
)

target_compile_definitions(To_Do_List
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(To_Do_List
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick)

set_target_properties(To_Do_List PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
)

qt_import_qml_plugins(To_Do_List)
qt_finalize_executable(To_Do_List)

target_include_directories(To_Do_List
        PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)
