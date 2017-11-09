import regex
from argparse import ArgumentParser


def count_lines(et, en):
    # count number of lines to be split
    return len(split_match(et, en))


def split_match(et, en):
    # find numbers of lines to be split
    # line that matches regexp has to have same number in both files
    # and to be split into same number of sentences
    rexp = regex.compile(r'(?<=[^0-9 ]{4}[.?!;])[\t\f\v ]+(?=\p{Lu})')
    et_list = []
    en_list = []
    with open(et,'r', encoding='utf-8') as et_file:
        # for each match append its line number to list (est)
        for i, line in enumerate(et_file, 1):
            if i % 1000 == 0:
                print('Checking et file, processed %s lines' % i, end='\r')
            matches = rexp.findall(line)
            if matches:
                et_list.extend([i] * len(matches))
    with open(en, 'r', encoding='utf-8') as en_file:
        # for each match append its line number to list (eng)
        for i, line in enumerate(en_file, 1):
            if i % 1000 == 0:
                print('Checking en file, processed %s lines' % i, end='\r')
            matches = rexp.findall(line)
            if matches:
                en_list.extend([i] * len(matches))
    # find intersection of line numbers in two files
    common_lines = set.intersection(set(et_list), set(en_list))
    same_count = []
    for n in common_lines:
        # check that lines are split into the same number of sentences in both files
        if et_list.count(n) == en_list.count(n):
            same_count.append(n)
    # return numbers of lines to split
    return same_count


def rewrite_files(et, en, output_et, output_en):
    # write output files with split sentences
    same_count = split_match(et, en)
    rexp = regex.compile(r'(?<=[^0-9 ]{4}[.?!;])[\t\f\v ]+(?=\p{Lu})')
    with open(et, 'r', encoding='utf-8') as et_file:
        with open(output_et, 'a', encoding='utf-8') as et_output:
            # rewrite lines in new file (est)
            for i, line in enumerate(et_file, 1):
                # report progress
                if i % 1000 == 0:
                    print('Rewriting et file, processed %s lines' % i, end='\r')
                if i in same_count:
                    # split sentences by regex
                    for sentence in regex.split(rexp, line):
                        et_output.write(sentence.strip() + '\n')
                else:
                    # keep single sentences as is
                    et_output.write(line)
    with open(en, 'r', encoding='utf-8') as en_file:
        with open(output_en, 'a', encoding='utf-8') as en_output:
            # rewrite lines in new file (est)
            for i, line in enumerate(en_file, 1):
                # report progress
                if i % 1000 == 0:
                    print('Rewriting en file, processed %s lines' % i, end='\r')
                if i in same_count:
                    # split sentences by regex
                    for sentence in regex.split(rexp, line):
                        en_output.write(sentence.strip() + '\n')
                else:
                    # keep single sentences as is
                    en_output.write(line)


if __name__ == '__main__':
    # parse arguments
    parser = ArgumentParser(description='Splitting sentences')
    parser.add_argument('-eti', '--est_input',
                        help='Estonian input file')
    parser.add_argument('-eni', '--eng_input',
                        help='English input file')
    parser.add_argument('-eto', '--est_output',
                        help='Estonian output file')
    parser.add_argument('-eno', '--eng_output',
                        help='English output file')
    parser.add_argument('-c', '--count_lines',
                        action='store_true',
                        help='Counts lines that will be split')
    args = parser.parse_args()
    eti = args.est_input
    eni = args.eng_input
    eto = args.est_output
    eno = args.eng_output
    count = args.count_lines
    if count:
        print('\nWill change %s lines' % count_lines(eti, eni))
    else:
        rewrite_files(eti, eni, eto, eno)
