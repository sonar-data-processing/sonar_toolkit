if (NOT DEFINED gnuplot_ROOT_DIR)
    set (
        gnuplot_ROOT_DIR
        "${WORKSPACE_DIR}/third_party/gnuplot-iostream"
        CACHE PATH "Gnuplot Root Directory"
        FORCE
    )

    set (
        gnuplot_INCLUDE_DIR
        "${WORKSPACE_DIR}/third_party/gnuplot-iostream"
        CACHE PATH "Gnuplot Include Directory"
        FORCE
    )
endif()
