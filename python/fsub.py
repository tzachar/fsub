import vim
import re


quoted_match = re.compile('''(f)?(?P<quote>['"]).*?(?P=quote)''')
def find_quoted_string(line, col):
    for match in quoted_match.finditer(line):
        # if match.start() <= col and match.end() >= col:
        if match.end() >= col:
            if match.group(1):
                return '{}{}'.format(
                    line[:match.start()],
                    line[match.start() + 1:])
            else:
                return '{}f{}'.format(
                    line[:match.start()],
                    line[match.start():])
    return None


def fsub_func():
    row, col = vim.current.window.cursor
    current_line = vim.current.buffer[row-1]
    new_line = None

    new_line = find_quoted_string(current_line, col)
    if new_line is not None:
        vim.current.buffer[row-1] = new_line
