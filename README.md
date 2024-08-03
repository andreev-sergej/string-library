# Static generic string library

![C](https://img.shields.io/badge/c-%2300599C.svg?style=for-the-badge&logo=c&logoColor=white)
![CMake](https://img.shields.io/badge/CMake-%23008FBA.svg?style=for-the-badge&logo=cmake&logoColor=white)
![GitHub License](https://img.shields.io/github/license/andreev-sergej/string-library?style=for-the-badge)

## Requirements
* GNU Compiler Collection (gcc)
* make

## Installation
Compile library using `make`. More details in Makefile.

## Types
* `String{size_t size; char *str}`

All functions are implemented using a generic code. Specifically by `_Generics` keyword. \
So all string-type parameters can be one of the three types:
* `String`
* Pointer to `String`
* `char` array

## Functions
* `String init_string(char *str)` - `String` initialization from char-array 
* `int deinit_string(String *string)` - `String` struct memory release
* `String get_string(T)` - Returns `String` struct from T-type string
* `size_t str_length(T)` - Returns T-type string length
* `String str_substring(int start, int end, T)` - Extracts substring from T-type string
* `String str_cat(X, Y)` - Concatenates X-Type string with Y-Type string
* `int str_compare(X, Y)` - Compares strings X and Y and returns first difference
* `char* str_strchr(X, Y)` - Returns first Y char occurrence in X string
* `char* str_strrchr(X, Y)` - Returns last Y char occurrence in X string
* `char* str_tok(char *srcString, char *delim)` - Returns next `delim` string occurrence in `srcString`
* `*String str_split(X, Y, Z)` - Splits X-type string by Y-type delimiter and returns Z-int length `String` type array
 
## Example
```C
#include <stdio.h>
#include "library.h"

String *string_example;

int main()
{
    string_example = (struct String *)calloc(1, sizeof (struct String));
    *string_example = init_string("Something.");

    deinit_string(string_example);
    free(string_example);
    return 0;
}
```
