#include "grammer_internal.h"

OBJECT syd_compile_string(const char *f, GString *s, int line, int newlines);
OBJECT syd_compile_file(const char *f, GIOChannel *file, int start, int newlines);
GQuark id_to_quark(ID id);
