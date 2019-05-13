QT += core
QT += widgets

SOURCES += \
    main.cpp \
    mymainmindow.cpp

HEADERS += \
    mymainmindow.h


## comment this out if you need a different version of R,
## and set set R_HOME accordingly as an environment variable
R_HOME =                $$system(R RHOME)

## include headers and libraries for R
RCPPFLAGS =             $$system($$R_HOME/bin/R CMD config --cppflags)
RLDFLAGS =              $$system($$R_HOME/bin/R CMD config --ldflags)
RBLAS =                 $$system($$R_HOME/bin/R CMD config BLAS_LIBS)
RLAPACK =               $$system($$R_HOME/bin/R CMD config LAPACK_LIBS)

## if you need to set an rpath to R itself, also uncomment
#RRPATH =               -Wl,-rpath,$$R_HOME/lib

## include headers and libraries for Rcpp interface classes
RCPPINCL =              $$system($$R_HOME/bin/Rscript -e \'Rcpp:::CxxFlags\(\)\')
RCPPLIBS =              $$system($$R_HOME/bin/Rscript -e \'Rcpp:::LdFlags\(\)\')

## for some reason when building with Qt we get this each time
## so we turn unused parameter warnings off
RCPPWARNING =           -Wno-unused-parameter
## include headers and libraries for RInside embedding classes
RINSIDEINCL =           $$system($$R_HOME/bin/Rscript -e \'RInside:::CxxFlags\(\)\')
RINSIDELIBS =           $$system($$R_HOME/bin/Rscript -e \'RInside:::LdFlags\(\)\')

## compiler etc settings used in default make rules
QMAKE_CXXFLAGS +=       $$RCPPWARNING $$RCPPFLAGS $$RCPPINCL $$RINSIDEINCL
QMAKE_LFLAGS +=         $$RLDFLAGS $$RBLAS $$RLAPACK $$RCPPLIBS $$RINSIDELIBS

## addition clean targets
QMAKE_CLEAN +=          qtdensity Makefile
