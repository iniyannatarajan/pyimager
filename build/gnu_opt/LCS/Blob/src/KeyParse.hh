/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_KEYPARSE_SCRATCH_SOFTWARE_SRC_PYIMAGER_BUILD_GNU_OPT_LCS_BLOB_SRC_KEYPARSE_HH_INCLUDED
# define YY_KEYPARSE_SCRATCH_SOFTWARE_SRC_PYIMAGER_BUILD_GNU_OPT_LCS_BLOB_SRC_KEYPARSE_HH_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int KeyParsedebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    LITERAL = 258,
    NAME = 259,
    IS = 260,
    COMMA = 261,
    LBRACKET = 262,
    RBRACKET = 263,
    TOKENERROR = 264
  };
#endif
/* Tokens.  */
#define LITERAL 258
#define NAME 259
#define IS 260
#define COMMA 261
#define LBRACKET 262
#define RBRACKET 263
#define TOKENERROR 264

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 33 "KeyParse.yy" /* yacc.c:1909  */

LOFAR::KeyValue* val;
LOFAR::KeyValueMap* block;
LOFAR::vector<LOFAR::KeyValue>* vec;

#line 78 "/scratch/software/src/pyimager/build/gnu_opt/LCS/Blob/src/KeyParse.hh" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif



int KeyParseparse (void);

#endif /* !YY_KEYPARSE_SCRATCH_SOFTWARE_SRC_PYIMAGER_BUILD_GNU_OPT_LCS_BLOB_SRC_KEYPARSE_HH_INCLUDED  */
