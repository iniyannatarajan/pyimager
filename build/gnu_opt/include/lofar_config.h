/* $Id: lofar_config.h.cmake 27477 2013-11-21 13:08:20Z loose $ */

/*-------------------------------------------------------------------------*\
|     Defines for the presence or absence of (system) header files          |
\*-------------------------------------------------------------------------*/

/* Define to 1 if you have the <dlfcn.h> header file. */
#define HAVE_DLFCN_H 1

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the <net/ethernet.h> header file. */
#define HAVE_NET_ETHERNET_H 1

/* Define to 1 if you have the <netdb.h> header file. */
#define HAVE_NETDB_H 1

/* Define to 1 if you have the <netinet/in.h> header file. */
#define HAVE_NETINET_IN_H 1

/* Define to 1 if you have the <signal.h> header file. */
#define HAVE_SIGNAL_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <sys/mman.h> header file. */
#define HAVE_SYS_MMAN_H 1

/* Define to 1 if you have the <sys/resource.h> header file. */
#define HAVE_SYS_RESOURCE_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/timepps.h> header file. */
/* #undef HAVE_SYS_TIMEPPS_H */

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1


/*-------------------------------------------------------------------------*\
|     Defines for the presence or absence of (system) types                 |
\*-------------------------------------------------------------------------*/

/* Define if `long long' is supported */
#define HAVE_LONG_LONG 1

/* Define if `uint' is supported */
#define HAVE_UINT 1

/* Define if `ulong' is supported */
#define HAVE_ULONG 1

/* Define if `ushort' is supported */
#define HAVE_USHORT 1

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
/* #undef WORDS_BIGENDIAN */


/*-------------------------------------------------------------------------*\
|     Defines for the presence or absence of (system) libraries             |
\*-------------------------------------------------------------------------*/

/* Define if AIPS++ is installed */
#define HAVE_AIPSPP

/* Define if libbfd is available */
/* #undef HAVE_BFD */

/* Define if BG/L MPICH is installed */
/* #undef HAVE_BGLMPICH */

/* Define if Blitz is installed */
#define HAVE_BLITZ 1

/* Define if BOOST is installed */
#define HAVE_BOOST 1

/* Define if BOOST component regex is installed */
/* #undef HAVE_BOOST_REGEX */

/* Define if BOOST component date_time is installed */
/* #undef HAVE_BOOST_DATE_TIME */

/* Define if CASACORE is installed with the requested components */
#define HAVE_CASACORE 1

/* Define if DAL is installed */
/* #undef HAVE_DAL */

/* Define if FFTW2 is installed */
/* #undef HAVE_FFTW2 */

/* Define if FFTW3 is installed */
#define HAVE_FFTW3

/* Define if libgcrypt is installed */
/* #undef HAVE_GCRYPT */

/* Define if HDF5 is installed */
/* #undef HAVE_HDF5 */

/* Define if LAM is installed */
/* #undef HAVE_LAM */

/* Define if libnuma is installed */
/* #undef HAVE_LIBNUMA */

/* Define if libssh2 is installed */
/* #undef HAVE_LIBSSH2 */

/* Define if LOG4CPLUS is installed */
#define HAVE_LOG4CPLUS 1

/* Define if LOG4CXX is installed */
/* #undef HAVE_LOG4CXX */

/* Define if we have an MPI implementation installed */
/* #undef HAVE_MPI */

/* Define if MASS is installed */ 
/* #undef HAVE_MASS */

/* Define if MPICH is installed */
/* #undef HAVE_MPICH */

/* Define if libopenssl + libcrypto is installed */
/* #undef HAVE_OPENSSL */

/* Define if libpqxx is installed */
/* #undef HAVE_PQXX */

/* Define if PVSS is installed */
/* #undef HAVE_PVSS */

/* Define if using Rational Purify */
/* #undef HAVE_PURIFY */

/* Define if readline is installed */
/* #undef HAVE_READLINE */

/* Define if ScaMPI is installed */
/* #undef HAVE_SCAMPI */

/* Defined if shared memory is used */
#define HAVE_SHMEM 1

/* Define if WCSLIB is installed */
/* #undef HAVE_WCSLIB */


/*-------------------------------------------------------------------------*\
|  Defines for the presence or absence of (system) functions                |
\*-------------------------------------------------------------------------*/

/* Define to __PRETTY_FUNCTION__, __FUNCTION__, or "<unknown>" */
#define AUTO_FUNCTION_NAME __PRETTY_FUNCTION__

/* Define to 1 if you have the `backtrace' function. */
#define HAVE_BACKTRACE 1

/* Define to 1 if you have a declaration for the `getprotobyname_r' function. */
#define HAVE_GETPROTOBYNAME_R 1

/* Define to 1 if you have a declaration for the `strnlen' function. */
#define HAVE_STRNLEN 1
