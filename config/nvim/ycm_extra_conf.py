#!/usr/bin/env python2

import sys, os.path

try:
    from ycm_core import CompilationDatabase

except ImportError:
    import json

    class CompilationDatabaseEntry(object):
        __slots__ = ['compiler_working_dir_', 'compiler_flags_']
        def __init__(self, directory, command):
            self.compiler_working_dir_ = directory
            self.compiler_flags_ = command.split()

    class CompilationDatabase(object):
        def __init__(self, dir):
            self.__cdb_cache = {}
            json_file = open(os.path.join(dir, 'compile_commands.json'))
            jdata = json.load(json_file)

            for entry in jdata:
                abs_path = os.path.join(entry['directory'], entry['file'])
                self.__cdb_cache[abs_path] = CompilationDatabaseEntry(
                    entry['directory'], entry['command'])

        def GetCompilationInfoForFile(self, filename):
            return self.__cdb_cache.get(filename)


BASE_FLAGS = [
    '-Wall',
    '-Wextra',
    '-std=c++14',
    '-I/usr/include/'
]

SOURCE_EXTENSIONS = [
    '.cpp',
    '.cxx',
    '.cc',
    '.c',
    '.m',
    '.mm'
]

HEADER_EXTENSIONS = [
    '.h',
    '.hxx',
    '.hpp',
    '.hh'
]


def IsHeaderFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in HEADER_EXTENSIONS


def GetCompilationInfoForFile(database, filename):
    if IsHeaderFile(filename):
        basename = os.path.splitext(filename)[0]
        for extension in SOURCE_EXTENSIONS:
            replacement_file = basename + extension
            if os.path.exists(replacement_file):
                compilation_info = database.GetCompilationInfoForFile(
                    replacement_file)
                if compilation_info.compiler_flags_:
                    return compilation_info
        return None
    return database.GetCompilationInfoForFile(filename)


def FindNearest(path, target):
    candidate = os.path.join(path, target)
    if os.path.isfile(candidate) or os.path.isdir(candidate):
        return candidate
    else:
        parent = os.path.dirname(os.path.abspath(path))
        if parent == path:
            raise RuntimeError('Could not find ' + target)
        return FindNearest(parent, target)


def MakeRelativePathsInFlagsAbsolute(flags, working_directory):
    if not working_directory:
        return list(flags)
    new_flags = []
    make_next_absolute = False
    path_flags = ['-isystem', '-I', '-iquote', '--sysroot=']
    for flag in flags:
        new_flag = flag

        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith('/'):
                new_flag = os.path.join(working_directory, flag)

        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break

            if flag.startswith(path_flag):
                path = flag[len(path_flag):]
                new_flag = path_flag + os.path.join(working_directory, path)
                break

        if new_flag:
            new_flags.append(new_flag)
    return new_flags


# TODO: remove?
def FlagsForClangComplete(root):
    try:
        clang_complete_path = FindNearest(root, '.clang_complete')
        return open(clang_complete_path, 'r').read().splitlines()
    except:
        return None


def FlagsForInclude(root):
    try:
        include_path = FindNearest(root, 'include')
        return ['-I' + include_path]
    except:
        return None


# TODO: cache datapases per compilation_db_dir
def FlagsForCompilationDatabase(root, filename):
    try:
        compilation_db_path = FindNearest(root, 'build/compile_commands.json')
        compilation_db_dir = os.path.dirname(compilation_db_path)
        compilation_db = CompilationDatabase(compilation_db_dir)
        if not compilation_db:
            return None
        compilation_info = GetCompilationInfoForFile(compilation_db, filename)
        if not compilation_info:
            return None
        return MakeRelativePathsInFlagsAbsolute(
            compilation_info.compiler_flags_,
            compilation_info.compiler_working_dir_)
    except:
        return None


def FlagsForFile(filename):
    root = os.path.realpath(filename)
    compilation_db_flags = FlagsForCompilationDatabase(root, filename)
    if compilation_db_flags:
        final_flags = compilation_db_flags
    else:
        final_flags = BASE_FLAGS
        clang_flags = FlagsForClangComplete(root)
        if clang_flags:
            final_flags += clang_flags
        include_flags = FlagsForInclude(root)
        if include_flags:
            final_flags += include_flags
    return {
        'flags': final_flags,
        'do_cache': True
    }


def main(argv):
    if len(argv) < 2:
        sys.stderr.write("Usage: %s <file>" % (argv[0],))
        return -1

    if not os.path.exists(argv[1]):
        sys.stderr.write("ERROR: File %r was not found!" % (argv[1],))
        return -1

    flags = FlagsForFile(argv[1])
    print("Compile flags for", argv[1], ":", flags['flags'])
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
