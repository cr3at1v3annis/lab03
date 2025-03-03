include(InstallRequiredSystemLibraries)

set(CPACK_PACKAGE_VERSION_MAJOR 1)
set(CPACK_PACKAGE_VERSION_MINOR 0)
set(CPACK_PACKAGE_VERSION_PATCH 0)

set(CPACK_PACKAGE_NAME "solver")
set(CPACK_PACKAGE_CONTACT ${GITHUB_EMAIL})
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Solver packaging")

option(Flag "flag" DEFAULT)
if (${Flag} MATCHES ARC)
    set(CPACK_GENERATOR "TGZ;ZIP")
    install(FILES formatter_lib/formatter.cpp formatter_ex_lib/formatter_ex.cpp
            solver_lib/solver.cpp solver_application/equation.cpp DESTINATION code)
    install(TARGETS formatter_ex solver LIBRARY DESTINATION lib)
endif()
if (${Flag} MATCHES RPM)
    set(CPACK_GENERATOR "RPM")
    install(TARGETS solver DESTINATION bin)
endif()
if (${Flag} MATCHES DEB)
    set(CPACK_DEBIAN_PACKAGE_MAINTAINER "cr3at1v3annis")
    set(CPACK_GENERATOR "DEB")
    install(TARGETS solver DESTINATION bin)
endif()
if (${Flag} MATCHES MSI)
    set(MACOSX_BUNDLE TRUE)
    set(CPACK_GENERATOR "WIX")
    install(TARGETS solver DESTINATION bin)
endif()
if (${Flag} MATCHES DMG)
    set(CPACK_GENERATOR "DragNDrop")
    install(TARGETS solver DESTINATION bin)
endif()
include(CPack)